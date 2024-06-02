require("code_runner").setup({
    filetype = {
        kotlin = {
            "cd $dir &&",
            "kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar &&",
            "java -jar $fileNameWithoutExt.jar",
        }
    }
})
