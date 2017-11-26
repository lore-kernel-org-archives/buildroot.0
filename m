From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:49:47 +0100
Subject: [Buildroot] [git commit] libglib2: needs autoreconf
In-Reply-To: <20171017194108.2114F80415@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 17 Oct 2017 21:47:47 +0200")
References: <20171017194108.2114F80415@busybox.osuosl.org>
Message-ID: <877euchij8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=45fbec12e79dfd8416b20afa4c2590aecd3ddc5d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Patch 0002-disable-tests.patch modifies Makefile.am, so we have to
 > autoreconf. It hasn't been seen until now, but becomes very clear
 > since the bump of automake to 1.15.1, as we're seeing build failures
 > such as:

 > configure.ac:66: error: version mismatch.  This is Automake 1.15.1,
 > configure.ac:66: but the definition used by this AM_INIT_AUTOMAKE
 > configure.ac:66: comes from Automake 1.15.  You should recreate
 > configure.ac:66: aclocal.m4 with aclocal and run automake again.

 > Fixes:

 >   http://autobuild.buildroot.net/results/3402357d8e90f1866dfeaee7bb61119d80dc8bcb/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
