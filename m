From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:23:12 +0200
Subject: [Buildroot] [PATCH] wine: fix build breakage with ncursesw
In-Reply-To: <1430483839-26357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430483839-26357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150501162312.16ae8a85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  1 May 2015 09:37:19 -0300, Gustavo Zacarias wrote:
> The configure script doesn't detect ncursesw at all hence breaks the
> build. Backport a patch from upstream for this. Fixes:
> http://autobuild.buildroot.net/results/426/42669ca3b7215765a59a85c53ed724cbff79384e/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wine/0002-detect-ncursesw.patch | 17 +++++++++++++++++
>  package/wine/wine.mk                    |  2 ++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/wine/0002-detect-ncursesw.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
