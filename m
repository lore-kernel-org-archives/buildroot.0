From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Jul 2010 23:07:08 +0200
Subject: [Buildroot] [PATCH] ext-toolchains: fix libnss_*.so
	installation with external glibc
In-Reply-To: <1278619726-17555-1-git-send-email-luca@lucaceresoli.net> (Luca
	Ceresoli's message of "Thu, 8 Jul 2010 22:08:46 +0200")
References: <1278619726-17555-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <877hl53coz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Commit 7192668 introduced a wrong spelling of BR2_TOOLCHAIN_EXTERNAL_GLIBC
 Luca> that prevented libnss_files.so and libnss_dns.so from being installed.

Committed, thanks!

-- 
Bye, Peter Korsgaard
