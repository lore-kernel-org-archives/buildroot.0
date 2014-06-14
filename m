From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:38:13 +0200
Subject: [Buildroot] [PATCH] dialog: fix build failure
In-Reply-To: <1402743408-13111-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402743408-13111-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140614183813.36bd4990@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 14 Jun 2014 07:56:48 -0300, Gustavo Zacarias wrote:
> The old ncurses trick is no longer needed for this version, in fact it's
> harmful. Switch to proper configure options.
> Also disable rpath hackery since it's not required and could be
> problematic. Fixes:
> http://autobuild.buildroot.net/results/411/411f6171e972eab4486143dedbfd078136886ab0/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dialog/dialog.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
