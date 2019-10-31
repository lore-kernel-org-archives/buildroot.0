From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:35:55 +0100
Subject: [Buildroot] [PATCH 1/2] boot/uboot: fix the help text of
 BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
In-Reply-To: <20191027203144.5870-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 27 Oct 2019 21:31:43 +0100")
References: <20191027203144.5870-1-thomas.petazzoni@bootlin.com>
Message-ID: <87woclvv78.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 2c8ff251cb16d38fb417a488ee0367cd03eebda2 ("boot/uboot: add
 > option to generate env image from default env"), the possibility of
 > generating an environment image using the built-in U-Boot environment
 > as a source was added.

 > This is meant to happen when the string option
 > BR2_TARGET_UBOOT_ENVIMAGE_SOURCE is empty, but the original commit
 > added the Config.in help text to BR2_TARGET_UBOOT_ENVIMAGE, which is a
 > boolean option, and therefore cannot be empty.

 > Move the help text to BR2_TARGET_UBOOT_ENVIMAGE_SOURCE, where it
 > belongs.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
