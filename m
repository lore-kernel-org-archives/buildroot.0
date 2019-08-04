From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 18:34:56 +0200
Subject: [Buildroot] [PATCH buildroot-test 0/9] several refactoring of
 daily-mail
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804183456.557c8172@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Aug 2019 12:53:39 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (9):
>   utils/daily-mail: make the script flake8 compliant
>   utils/daily-mail: replace function's comments by doc-strings
>   utils/daily-mail: add a function to shrink strings to a fixed size
>   utils/daily-mail: remove the unnecessary 'get_notification_for_dev'
>     function
>   utils/daily-mail: improve code readability
>   utils/daily-mail: change the URL length formatting to reflect the
>     actual URL length
>   utils/daily-mail: change variable name to be more explicit
>   utils/daily-mail: replace '%' style format strings by the newer '{}'
>     version
>   utils/daily-mail: add a header for the build_results section

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
