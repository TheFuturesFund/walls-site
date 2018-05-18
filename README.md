# Deploying the Site

This site is built by CicrleCI and uploaded to S3 on each new commit to the `beta` or `www` branches.
The `beta` branch is the default branch, so changes made there are automatically deployed to [https://beta.thewallsproject.org](https://beta.thewallsproject.org).

The `www` branch is deployed to [https://www.thewallsproject.org](https://beta.thewallsproject.org).
To move changes on `beta` to `www`, first [click this link](https://github.com/TheFuturesFund/walls-site/compare/www...beta).
Then, click "Create Pull Request".
After creating creating the pull request, scroll down and find the "Merge Pull Request" button and click that.
