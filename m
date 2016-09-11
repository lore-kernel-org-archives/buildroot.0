From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:00:01 +0200
Subject: [Buildroot] [PATCH] systemd: let getty instead of serial-getty
 handle /dev/console
In-Reply-To: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160911220001.64dcf118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 18:10:18 +0200, Floris Bos wrote:
> The serial-getty unit depends on dev-%i.device which does not
> seem to be created for /dev/console
> Workaround this by letting normal getty unit handle things
> if BR2_TARGET_GENERIC_GETTY_PORT is set to 'console'
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Yann, Maxime, could you please review this patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
