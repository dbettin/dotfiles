colorscheme base16_embers

# make it dark
face Default          default,default
face MenuBackground   default,black
face MenuForeground   black,default
face MenuInfo         default
face StatusLine       default,black
face Information      default,black
face LineNumbers      default,rgb:111111
face LineNumberCursor default,black+b
face BufferPadding    default,default

# Basic options ├───────────────────────────────────────────────────────────────

set global ui_options ncurses_status_on_top=yes:ncurses_assistant=cat
set global tabstop     2
set global indentwidth 2
set global scrolloff 1,5
set global grepcmd 'rg -n'

# Commands ├────────────────────────────────────────────────────────────────────

def ide %{
    rename-client main
    set global jumpclient main

    new rename-client tools
    set global toolsclient tools

    new rename-client docs
    set global docsclient docs
}


# Convenience mappings ├────────────────────────────────────────────────────────

map global normal '#' :comment-line<ret>
map global normal <a-#> ':comment-selection<ret>'
map global insert <c-k> '<a-;>!ufind digraph -c '
map global insert <tab> '<a-;><a-gt>'
map global insert <backtab> '<a-;><lt>'
map global user b ':make<ret>'
map global user c ':format<ret>'
map global user l ':lint<ret>'
map global user n ':lint-next<ret>'
map global user r ':ranger<ret>'

# Hooks ├───────────────────────────────────────────────────────────────────────


hook global WinCreate ^[^*]+$ %{
  ranger-open-on-edit-directory
  add-highlighter number_lines
  add-highlighter show_matching
}

# Clipboard ────────────────────────────────────────────────────────────────────

map global user p '<a-!>xsel --output --clipboard<ret>'
map global user P '!xsel --output --clipboard<ret>'

hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_reg_dquote" | xsel --input --primary
  printf %s "$kak_reg_dquote" | xsel --input --clipboard
}}

# Auto-mkdir when saving buffer to file ────────────────────────────────────────

hook global BufWritePre .* %{ nop %sh{ dir=$(dirname $kak_buffile)
  [ -d $dir ] || mkdir --parents $dir
}}

# File type ├───────────────────────────────────────────────────────────────────

# Rust ────────────────────────────────────────────────────────────────────────
 
 hook global WinSetOption filetype=rust %{
    set-option window formatcmd 'rustfmt'
    set-option window makecmd 'cargo build'
    racer-enable-autocomplete
    set buffer tabstop     4
    set buffer indentwidth 4
}

# Shell ────────────────────────────────────────────────────────────────────────

hook global WinSetOption filetype=sh %{
  set buffer tabstop     2
  set buffer indentwidth 2
}

# Markdown ─────────────────────────────────────────────────────────────────────

add-highlighter -group /markdown/content regex ^\h{4} 0:blue

# Functions ─────────────────────────────────────────────────────────────────────
 
map global user b ":fzf-buffer<ret>"
map global user f ":fzf-file<ret>"

def -docstring 'invoke fzf to open a file' \
  fzf-file %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo only works inside tmux
    else
      FILE=`fzf-tmux -d 15`
      if [ -n "$FILE" ]; then
        echo "eval -client '$kak_client' 'edit ${FILE}'" | kak -p ${kak_session}
      fi
    fi
}}

def -docstring 'invoke fzf to select a buffer' \
  fzf-buffer %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo only works inside tmux
    else
      BUFFER=`echo ${kak_buflist} | tr : '\n' | fzf-tmux -d 15`
      if [ -n "$BUFFER" ]; then
        echo "eval -client '$kak_client' 'buffer ${BUFFER}'" | kak -p ${kak_session}
      fi
    fi
}}
