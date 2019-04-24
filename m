From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:24:11 +0200
Subject: [Buildroot] [PATCH 1/2] configs: asus_tinker_rk3288: Fix
 booting larger uImage
In-Reply-To: <20190415143409.24726-1-shyam.saini@amarulasolutions.com> (Shyam
 Saini's message of "Mon, 15 Apr 2019 20:04:08 +0530")
References: <20190415143409.24726-1-shyam.saini@amarulasolutions.com>
Message-ID: <878svz8844.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shyam" == Shyam Saini <shyam.saini@amarulasolutions.com> writes:

 > Default value of CONFIG_SYS_BOOTM_LEN in u-boot causes board reset for
 > larger uImage files, so add u-boot patch to increase its size

 > Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
