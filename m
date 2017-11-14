From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 13:56:29 +0100
Subject: [Buildroot] [PATCH] support/config-fragments: update ARC
 toolchain
In-Reply-To: <20171113222914.1487-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 13 Nov 2017 23:29:14 +0100")
References: <20171113222914.1487-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87a7zp2f42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit updates the br-arcle-hs38 configuration fragment to use a
 > slightly updated ARC toolchain in which the RPATH of the ar and ranlib
 > tools have been manually fixed to be correct. This is a temporary
 > workaround until the issue gets resolved properly in the RPATH fixing
 > logic, and is needed to fix a number of build issues.

 > Fixes:

 >   http://autobuild.buildroot.net/results/0ae0d6eba6e2cd8d2298cc4ba6380b8c3e9dd86a/
 >   (libnl)

 >   http://autobuild.buildroot.net/results/fa9bdad8d8b57d1db7f22abdb063ade470e9f938/
 >   (pcsc-lite)

 >   http://autobuild.buildroot.net/results/fca2ad71c7d446e4738834a1f220d950bce5fddd/
 >   (alsa-lib)

 >   http://autobuild.buildroot.net/results/945c60ff942dfd3daa4da27f5e19470e3d97aed4/
 >   (libcap)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
