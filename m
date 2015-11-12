From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 22:23:56 +0100
Subject: [Buildroot] [PATCH 1/1] ltris: add upstream patch to fix buld
	with GCC 5
In-Reply-To: <1447296163-26732-1-git-send-email-rprebello@gmail.com> (Rodrigo
 Rebello's message of "Thu, 12 Nov 2015 00:42:43 -0200")
References: <1447296163-26732-1-git-send-email-rprebello@gmail.com>
Message-ID: <87bnayoqs3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > LTris was failing to build with GCC 5 due to a change in semantics
 > regarding inline functions compared to previous GCC versions.

 > The issue has already been solved upstream, but a new version hasn't
 > been released yet.

 > Fixes:

 >   http://autobuild.buildroot.net/results/d5e/d5e832c3aa7ee7af128e2ba1835fe7d5d69d7ce8/
 >   http://autobuild.buildroot.net/results/e73/e7306093e0ae1a1dcb69f015b10d56e4c95e689e/
 >   http://autobuild.buildroot.net/results/781/781e891e8a59dab29b0ec37d43cd03107f6cce5b/
 >   ...

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
