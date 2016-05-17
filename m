From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:47:34 +0200
Subject: [Buildroot] [PATCH 2/4] android-tools: fix build on big endian
	systems
In-Reply-To: <1463235434-31134-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 14 May 2016 16:17:12 +0200")
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463235434-31134-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h9dwbxu1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to the android-tools package to make it build
 > properly on big-endian systems.

 > Fixes:

 >   http://autobuild.buildroot.net/results/1b8ace1a083b419c1ab913fda0d36a1d2d910f13/ (PowerPC)
 >   http://autobuild.buildroot.net/results/5bb304c91367f1570903c8c527b387c65e572e56/ (Xtensa)

 > Cc: Gary Bisson <gary.bisson@boundarydevices.com>
 > Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
 > Cc: Julien Corjon <corjon.j@ecagroup.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
