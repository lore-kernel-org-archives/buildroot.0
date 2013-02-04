From: kumar sarma <swaroopkumarsarma@yahoo.co.in>
Date: Mon, 4 Feb 2013 21:30:08 +0800 (SGT)
Subject: [Buildroot] Error in oprofile build
Message-ID: <1359984608.78532.YahooMailNeo@web194602.mail.sg3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
?
We are using the 2.6.32.42 kernel, uclibc on mips platform. When i tried to compile the oprofile i am getting the following error.
/staging_dir/target-mips_r2_uClibc-0.9.30.1_arx388_rt_he_adsl_mlcnand_smp_sample/usr/lib/libopcodes-2.19.1.so not found.
But i am able to locate the libopcodes.a in the library path but not the .so.
Can some one help on how to generate a .so for libopcodes which will come as a part of binutils.
?
Regards,
Swaroop.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130204/76742e4f/attachment.html>
