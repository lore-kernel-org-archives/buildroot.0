From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:16:23 +0200
Subject: [Buildroot] [PATCH 18/46] u-boot: remove unneeded symbolic link
 + blank line
In-Reply-To: <8739wxi437.fsf@macbook.be.48ers.dk>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fce3ab311202b3d347f76da0e96d5fd7fbf1bb27.1275343447.git.thomas.petazzoni@free-electrons.com>
	<8739wxi437.fsf@macbook.be.48ers.dk>
Message-ID: <20100612161623.213ff74a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 08 Jun 2010 23:53:16 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> $(STRIP_STRIP_UNNEEDED) $@
>  Thomas> -	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
> 
> Why is this unneeded? The fw_setenv link is needed to be able to set
> parameters.

I misread: I thought it was fw_printenv twice. I've removed this commit.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
