function gs --wraps='git status' --description 'alias gs git status'
  echo
  git status $argv
  echo        
end
