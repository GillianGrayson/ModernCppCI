git init
touch README.md
git add README.md
git add .gitignore
git commit -m "initial commit"
cd third_party
rmdir Catch2
git submodule add --depth 1 -- https://github.com/catchorg/Catch2.git
rmdir spdlog
git submodule add --depth 1 -- https://github.com/gabime/spdlog.git
cd ..
