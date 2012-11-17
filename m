From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 09:26:09 +0100
Subject: [Buildroot] [PATCH 2/2] Mark a number of development related
	packages as deprecated
In-Reply-To: <c42b5a3ae08ae07779a6ee389a8367318efe96bf.1352586949.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 10 Nov 2012 23:36:03 +0100")
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <c42b5a3ae08ae07779a6ee389a8367318efe96bf.1352586949.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878va0ws7y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> automake, autoconf, libtool and make on the target are basically
 Thomas> useless if we don't support building a toolchain on the target. Of
 Thomas> course, the host variant of automake, autoconf and libtool will remain
 Thomas> available.

Committed with some fixups to apply after the perl/qemu changes.

-- 
Bye, Peter Korsgaard
