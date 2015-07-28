From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:16:20 +0200
Subject: [Buildroot] [PATCH] usb_modeswitch: fix static build failure
In-Reply-To: <1438084318-27699-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438084318-27699-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150728231620.32014444@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Jul 2015 08:51:58 -0300, Gustavo Zacarias wrote:
> abort() is used in two different places, jim (proper C library abort)
> and usb_modeswitch.c (custom abort function).
> Status: emailed the patch to author.
> 
> Fixes:
> http://autobuild.buildroot.net/results/789/7899a37d2c766716a1deff58e8be94c5c4962240/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/usb_modeswitch/0001-rename-abort.patch | 105 +++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 package/usb_modeswitch/0001-rename-abort.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
