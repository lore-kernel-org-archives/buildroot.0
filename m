From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 20:56:04 +0100
Subject: [Buildroot] [PATCH] f2fs-tools: add big-endian fixes/patches
 from upstream
In-Reply-To: <1419352039-9384-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419352039-9384-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141223205604.01741f97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 23 Dec 2014 13:27:19 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/8f9/8f97186489134619de7086028a59523d528b0d51/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...tools-fix-for-build-big-endian-processors.patch | 95 ++++++++++++++++++++++
>  ...sible-endianes-bug-in-mkfs.f2fs-roll-forw.patch | 81 ++++++++++++++++++
>  2 files changed, 176 insertions(+)
>  create mode 100644 package/f2fs-tools/0001-f2fs-tools-fix-for-build-big-endian-processors.patch
>  create mode 100644 package/f2fs-tools/0002-mkfs.f2fs-possible-endianes-bug-in-mkfs.f2fs-roll-forw.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
