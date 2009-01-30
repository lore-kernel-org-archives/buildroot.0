From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 14:41:01 +0100
Subject: [Buildroot] Broken symbolic links in generated toolchain
In-Reply-To: <20090130122415.2c585016@surf> (Thomas Petazzoni's message of
	"Fri\, 30 Jan 2009 12\:24\:15 +0100")
References: <20090130122415.2c585016@surf>
Message-ID: <87skn0nc7m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hi,
 Thomas> I just grabbed -rc2 and simply generated a MIPS toolchain (no
 Thomas> packages).

 Thomas> After generation, the STAGING_DIR has two broken symbolic links:

 Thomas>  mips-linux -> mips-linux-uclibc
 Thomas>  usr/bin/cc -> usr/bin/gcc

 Thomas> While not preventing the toolchain from working, it always seems
 Thomas> strange to have broken symlinks.

Thanks, fixed in r25166.

-- 
Bye, Peter Korsgaard
