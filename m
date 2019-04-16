From: Vadym Kochan <vadim4j@gmail.com>
Date: Tue, 16 Apr 2019 12:47:32 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-15
In-Reply-To: <20190416060047.6838786EF6@hemlock.osuosl.org>
References: <20190416060047.6838786EF6@hemlock.osuosl.org>
Message-ID: <20190416094732.GA27198@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All

On Tue, Apr 16, 2019 at 06:00:42AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-04-15
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  25 |   0 |   0 |  25 |
>       master | 167 |  50 |   0 | 217 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
[SNIP]
>                     git-2.16.5 | 5 

By the way this old patch still fixes the issue with git + nls enabled:
https://patchwork.ozlabs.org/patch/962166/

[SNIP]

>          arm |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/091b790ca6f5b46d5d29211dc1cb3ff05b62a965 |     
>       mipsel |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/a69b58b35b270fdd2df9b076e7030bb594520197 |     
>         m68k |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/f104c4e6ff41b1dd175f2d27f3b4ea7c9b61f7c5 |     
>          arm |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/ee12bdba398a139995de5f6f6718be6a493541d9 |     
>         i686 |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/74fa6b2bfbb1301e35c9dd1bbc04856c1cbf25f2 |     

[SNIP]

May be I need to re-think and provide better fix approach, but current one is simple and does
not require patch.

Regards,
Vadim Kochan
