From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun, 7 Apr 2019 13:05:01 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-06
In-Reply-To: <20190407060043.AF7738791E@hemlock.osuosl.org>
References: <20190407060043.AF7738791E@hemlock.osuosl.org>
Message-ID: <20190407100501.o6vt2d4rfh6b5x34@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Sun, Apr 07, 2019 at 06:00:36AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-04-06
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  58 |   3 |   1 |  62 |
>       master | 158 | 437 |   2 | 597 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>           host-libglib2-2.56.4 | 378
> host-gcc-final-arc-2018.09-... | 39

The following patch fixes failures from above:

	https://patchwork.ozlabs.org/patch/1079937/

[SNIP]

Regards,
Vadim Kochan
