From: Vadym Kochan <vadim4j@gmail.com>
Date: Wed, 17 Apr 2019 13:28:28 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-16
In-Reply-To: <20190417060039.CCB8586D39@whitealder.osuosl.org>
References: <20190417060039.CCB8586D39@whitealder.osuosl.org>
Message-ID: <20190417102828.GA700@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas, All

On Wed, Apr 17, 2019 at 06:00:33AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-04-16
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  16 |   1 |   0 |  17 |
>       master | 195 |  42 |   2 | 239 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                 cracklib-2.9.7 | 6 
>                madplay-0.15.2b | 5 
>                postgresql-11.2 | 5 
>                    netsurf-3.8 | 4 
>                   davfs2-1.5.4 | 2 
>                     efl-1.22.0 | 2 
>                 host-libsodium | 2 
> minicom-19ab49422f3431102c3... | 2 
>                    dvblast-3.4 | 1 
>                     git-2.16.5 | 1 

Again regarding the git fail issue, I posted better (I think) patch for
NLS support for git, and I think it more clearer now and might be posted to
git community:
https://patchwork.ozlabs.org/patch/1086723/

Sorry to make such noise with that.

[SNIP]

Regards,
Vadim Kochan
