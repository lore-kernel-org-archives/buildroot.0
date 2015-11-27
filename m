From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:49:54 +0100
Subject: [Buildroot] [PATCH] espeak: fix build on sparc64
In-Reply-To: <1448634261-6630-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 27 Nov 2015 15:24:21 +0100")
References: <1448634261-6630-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878u5jqnu5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > sparc64 needs object files to be built with -fPIC in order to be
 > usable in shared libraries, otherwise the shared library cannot be
 > created.

 > Fixes:

 >   http://autobuild.buildroot.org/results/8b8/8b894f0bd42c18e7cda98c15480757f10d743423/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
