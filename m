From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:02:34 +0100
Subject: [Buildroot] [PATCH 1/3] webkitgtk24: add multimedia option
In-Reply-To: <1457988735-22815-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457988735-22815-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160319150234.4155f7b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Mar 2016 17:52:13 -0300, Gustavo Zacarias wrote:
> Add a BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA option that will select/pull in
> the basic required components in order for a few multimedia websites
> (HTML5 video) to work.
> Tested with videojs.com & youtube.com
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/webkitgtk24/Config.in      | 24 ++++++++++++++++++++++++
>  package/webkitgtk24/webkitgtk24.mk |  4 ++--
>  2 files changed, 26 insertions(+), 2 deletions(-)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
