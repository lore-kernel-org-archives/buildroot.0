From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:41:55 +0200
Subject: [Buildroot] [PATCH 1/4] configs/amarula_vyasa_rk3288: adjust
 U-Boot config to boot larger kernel image
In-Reply-To: <20190419095718.8444-1-shyam.saini@amarulasolutions.com> (Shyam
 Saini's message of "Fri, 19 Apr 2019 15:27:15 +0530")
References: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
Message-ID: <87ef5p0wh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shyam" == Shyam Saini <shyam.saini@amarulasolutions.com> writes:

 > Default value of CONFIG_SYS_BOOTM_LEN in u-boot causes board reset for
 > large uImage files, so add u-boot patch to increase the maximum kernel
 > image size.

 > Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
