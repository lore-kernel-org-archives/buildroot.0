From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:13:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtl8821au: switch upstream to
 abperiasamy
In-Reply-To: <1469220888-2215-1-git-send-email-christian@paral.in>
References: <1469220888-2215-1-git-send-email-christian@paral.in>
Message-ID: <20160723151352.77eea94b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jul 2016 13:54:48 -0700, Christian Stewart wrote:
> Switching to the very active and well maintained rtl8821au
> fork at github.com/abperiasamy/rtl8812AU_8821AU_linux.

Is it really more active and maintained? This new github in fact has a
lot less recent commits that the current github we're using. So it
isn't really clear that this new github is a better "upstream". What
makes you believe it is a better upstream?

Also, what about the firmware? If it's no longer part of this new
upstream project, how can people get the firmware? Is it part of
linux-firmware?

Not your fault, but it would be so much better if those people
submitted such drivers to the staging tree of the official Linux
kernel. This way, instead of having multiple separate efforts to
cleanup/fix such drivers, there would be a single place.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
