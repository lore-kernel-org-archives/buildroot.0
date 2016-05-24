From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 21:49:46 +0200
Subject: [Buildroot] [PATCH] strongswan: needs __atomic operations
In-Reply-To: <1464103793-13228-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 24 May 2016 17:29:53 +0200")
References: <1464103793-13228-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fut7b5id.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > strongswan uses the __atomic_*() intrinsics, so we make it depend on
 > BR2_TOOLCHAIN_HAS_ATOMIC and link with libatomic when available. This
 > allows to fix the build on SPARC, therefore fixing:

 >   http://autobuild.buildroot.org/results/7e090237801874fb889c76f84863dc4c2ca20450/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
