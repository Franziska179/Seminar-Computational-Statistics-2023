using PkgTemplates

t = Template(;
    user="your-GitHub-username",
    authors=["Your Name"],
    plugins=[
        License(name="MIT"),
        Git(),
        GitHubActions(),
        Codecov()
    ],
    # dir="~/Documents/GitHub/"
)

t("YourPackageName")