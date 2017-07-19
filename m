From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 14:52:46 +0200
Subject: [Buildroot] [PATCH 2/2] boot/syslinux: disable syslinux
	legacy-BIOS for toolchains affected by binutils bug 19615
In-Reply-To: <20170704120110.29107-2-romain.naour@smile.fr> (Romain Naour's
 message of "Tue, 4 Jul 2017 14:01:10 +0200")
References: <20170704120110.29107-1-romain.naour@smile.fr>
 <20170704120110.29107-2-romain.naour@smile.fr>
Message-ID: <87tw28bnc1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Since [1] syslinux is build with the target toolchain in order to
 > properly build with gnu-efi package.
 > But toolchains built with binutils 2.26 break the syslinux legacy-BIOS
 > build as reported [2].

 > Thanks to Beno?t Allard for the investigation and the link to the
 > binutils bug [3].

 > [1] 6e432d5ecb46959f3c27dbbca48e41512bb40a70
 > [2] http://lists.busybox.net/pipermail/buildroot/2017-July/196253.html
 > [3] https://sourceware.org/bugzilla/show_bug.cgi?id=19615

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Beno?t Allard <benoit.allard@greenbone.net>

Committed to 2017.05.x, thanks.

I take it that our internal 2.26.1 binutils isn't affected by this?

-- 
Bye, Peter Korsgaard
