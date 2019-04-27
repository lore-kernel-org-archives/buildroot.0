From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:23:36 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/genimage: bump version
In-Reply-To: <20190426151947.31836-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 26 Apr 2019 17:19:44 +0200")
References: <20190426151947.31836-1-thomas.petazzoni@bootlin.com>
 <20190426151947.31836-2-thomas.petazzoni@bootlin.com>
Message-ID: <87k1ffvdpz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit bumps the genimage version to a not yet released commit,
 > in order to benefit from the GPT support that was added in upstream
 > genimage.

 > Indeed, we are about to add a defconfig for the STM32MP157 Discovery
 > Kit platform and the STM32MP157 BootROM loads the first stage
 > bootloader from the GPT partitions named fsbl*, which requires a GPT
 > partition table.

 > We will of course be able to switch back to a released version once a
 > release that includes GPT support will have been done upstream.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Do you know when v11 is planned? genimage-10 was released more than 1
year ago by now (Mar 29 2018).

-- 
Bye, Peter Korsgaard
