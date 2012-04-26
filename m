From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Apr 2012 11:01:22 +0200
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
 BR2_INSTALL_LIBSTDCPP
In-Reply-To: <CAAawjsQAg_90wznyQw57NbhERqGDizc89Vx2y6rmRb+9B-hAFA@mail.gmail.com>
References: <CAAawjsQAg_90wznyQw57NbhERqGDizc89Vx2y6rmRb+9B-hAFA@mail.gmail.com>
Message-ID: <20120426110122.2b3e38bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Apr 2012 16:58:09 +0800,
chinna obireddy <chinnaobi@gmail.com> a ?crit :

> *cp: cannot stat
> `/Reddy/11n_Build/Test/dev_main/build/gcc-4.3.3/build_mips/staging_dir/usr/mips-linux-uclibc/lib*/libstdc++.so*':
> No such file or directory*

I am not sure what you are using, but looking at this path, it seems
like it is definitely not a recent Buildroot version.

Could you please specify which Buildroot version you're using, and
your .config file? Note that if you're using an ancient Buildroot
version, it's unlikely that we will do anything besides suggesting you
to upgrade to a modern version.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
