From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Mar 2010 20:22:19 +0100
Subject: [Buildroot] arm-linux-as available in buildroot?
In-Reply-To: <SNT129-W43F44E6D9F28F855B5F85FB9380@phx.gbl>
References: <SNT129-W43F44E6D9F28F855B5F85FB9380@phx.gbl>
Message-ID: <20100305202219.4fe09a1b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 5 Mar 2010 18:05:22 +0100
Tony Mozi <spooflinux@hotmail.fr> wrote:

> I have not find arm-linux-as in the buildroot, there are a lot of
> language but asm seems to be absent. Is it possible to add it? By a
> patch? or another way?

If you use an Buildroot toolchain (i.e a toolchain that Buildroot
generates), then it is in $(STAGING_DIR)/usr/bin/arm-*-as. If you use an
external toolchain, then it is inside your external toolchain.

Just run "find output/ -name 'arm-*-as'

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
