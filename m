From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 12:26:00 +0100
Subject: [Buildroot] [PATCH] u-boot: u-boot SPL is usually under ./spl/
In-Reply-To: <CAOQ7t2bGKQ7y_9ap1AMxi9On8Z_CqUTJDwDPcG3XEM+9KMzrQw@mail.gmail.com>
 (Carlo Caione's message of "Sun, 3 Mar 2013 21:53:16 +0100")
References: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
 <20130303192824.2a2faf5d@skate>
 <CAOQ7t2ZJsu5u706BHJsuX6vOPgB5_oUJfF05EZYESpCjunvb=Q@mail.gmail.com>
 <20130303205242.423ad324@skate>
 <CAOQ7t2bGKQ7y_9ap1AMxi9On8Z_CqUTJDwDPcG3XEM+9KMzrQw@mail.gmail.com>
Message-ID: <878v63cson.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlo" == Carlo Caione <carlo.caione@gmail.com> writes:

 >> What about setting BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin" ?

 Carlo> Well, honestly I don't like it (not really clean) but I'll go for it
 Carlo> if there is no other way :)

 Carlo> (BTW, IIRC MLO in OMAP is just spl/u-boot-spl.bin with an
 Carlo> additional header)

True, but the header is essential to get the ROM to use it.

I find it ok that the path is relative to the u-boot basedir.

-- 
Bye, Peter Korsgaard
