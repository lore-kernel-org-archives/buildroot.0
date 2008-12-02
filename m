From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Dec 2008 10:15:24 +0100
Subject: [Buildroot] [PATCH] target/cramfs/cramfs.mk: Fix device table
	not being passed to mkcramfs
In-Reply-To: <4934B65A.90804@genesysdesign.com.au> (Jared Holzman's message of
	"Tue\, 02 Dec 2008 15\:15\:22 +1100")
References: <4934B65A.90804@genesysdesign.com.au>
Message-ID: <87tz9nuedv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jared" == Jared Holzman <j.holzman@genesysdesign.com.au> writes:

Hi,

 Jared> While mkcramfs was being patched to support a device table,
 Jared> the target device table was not being passed to the mkcramfs
 Jared> options. This patch fixes that

Thanks, committed as r24228.

-- 
Bye, Peter Korsgaard
