From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 09 Aug 2018 23:21:02 -0300
Subject: [Buildroot] [2018.02.x 2/2] support/testing: add test for file
 capabilities
References: <20180806031715.7088-2-ricardo.martincoski@gmail.com>
Message-ID: <5b6cf68edeebc_57833f926c0b30402199d@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please notice this test case could be applied to master or next, but it will
fail until we fix #11216.

On Mon, Aug 06, 2018 at 12:17 AM, Ricardo Martincoski wrote:

[snip]
> complete run on GitLab CI on top of 2018.02.4 with the series applied:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27226377

https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985522 
passed, #11191 fixed

> only the test on top of 2018.02.4:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985431

failed, detects #11191

> only the test on top of 2018.05.1:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985455

failed, detects #11216

> only the test on top of 2018.08-rc1:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985484

failed, detects #11216


Regards,
Ricardo
