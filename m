From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:20:37 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: aarch64: Prevent
	selecting unsupported versions
In-Reply-To: <20170806134011.30228-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 6 Aug 2017 15:40:11 +0200")
References: <20170806134011.30228-1-bernd.kuhls@t-online.de>
Message-ID: <87bmmolu56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Versions older than Linux v3.7 do not support the aarch64 architecture
 > so disable them, for reference see https://kernelnewbies.org/Linux_3.7

 > Without this patch these defconfigs fail to build

 > BR2_aarch64=y
 > BR2_KERNEL_HEADERS_3_2=y

 > BR2_aarch64=y
 > BR2_KERNEL_HEADERS_3_4=y

 > with error messages like this:

 > make[1]: Entering directory '/home/buildroot/br5_next/output/build/linux-headers-3.2.89'
 > Makefile:567: /home/buildroot/br5_next/output/build/linux-headers-3.2.89/arch/arm64/Makefile: No such file or directory

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
