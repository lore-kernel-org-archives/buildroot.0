From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 13:30:00 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: force -fno-stack-protector in
	CFLAGS
In-Reply-To: <20170830014756.1025-1-nunes.erico@gmail.com> (Erico Nunes's
 message of "Wed, 30 Aug 2017 03:47:56 +0200")
References: <20170830014756.1025-1-nunes.erico@gmail.com>
Message-ID: <87y3psdpzb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > grub2 fails to configure when BR2_SSP_ALL is enabled, with the following
 > configure error:

 >   checking whether -fno-asynchronous-unwind-tables works... yes
 >   checking whether -fno-unwind-tables works... yes
 >   checking for target linking format... unknown
 >   configure: error: no suitable link format found

 > This can be worked around by enforcing -fno-stack-protector in the
 > package CFLAGS in a way that overrides the SSP flag, as is already done
 > for the valgrind package.

 > Fixes bug #10261.

 > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 > Reported-by: Dr I J Ormshaw <ian_ormshaw@waters.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
