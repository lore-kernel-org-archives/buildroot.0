From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 22:04:44 +0100
Subject: [Buildroot] [PATCH] grub: force -m32 so we build grub 32 bits
	on 64 bits architecture
In-Reply-To: <1386185630-23338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 4 Dec 2013 20:33:50 +0100")
References: <1386185630-23338-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3fkjpjn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As reported by Matthew Weber, Grub doesn't build on 64 bits build
 > machines, because the host compiler produces 64 bits binaries by
 > default, while Grub should be built 32 bits. Therefore, this commit
 > passes -m32 to the Grub CFLAGS, so that 32 bits binaries are always
 > produced.

 > Reported-by: Matthew Weber <mlweber1@rockwellcollins.com>
 > Cc: Matthew Weber <mlweber1@rockwellcollins.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
