From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 18 Mar 2019 16:51:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-17
In-Reply-To: <20190318070113.E1E6A85CC3@whitealder.osuosl.org>
References: <20190318070113.E1E6A85CC3@whitealder.osuosl.org>
Message-ID: <20190318145122.GA4713@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, All,

On Mon, Mar 18, 2019 at 07:01:08AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-03-17
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  31 |   0 |   0 |  31 |
>    2018.11.x |  21 |   3 |   0 |  24 |
>    2019.02.x |  30 |   2 |   0 |  32 |
>       master | 245 |  62 |   3 | 310 |
> 
> Results for branch '2018.11.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                runc-v1.0.0-rc6 | 2 
>                 libsquish-1.15 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>         m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/c7357d045b078c5742bde21c82904b4ec0defc35 |     

Cherry-pick of the commit 57ee0f74ec226d2790af96de2b872135c1887f fixes
the issue, the issue is related to:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509

Regards,
Vadim Kochan
