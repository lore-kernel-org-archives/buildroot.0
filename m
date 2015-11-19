From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 13:19:32 +0100
Subject: [Buildroot] [PATCH] libserial: add patch to fix build failure
	on sparc/sparc64
In-Reply-To: <1447879238-29695-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 18 Nov 2015 21:40:38 +0100")
References: <1447879238-29695-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnaq9o6j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Like c-periphery and lua-periphery, libserial fails to build because
 > it tries to use some baud rate definitions that are not available on
 > sparc and sparc64 (the highest baud rates).

 > This commit fixes that by introducing a patch to libserial to make the
 > use of these high baud rates conditional on their availability.

 > Fixes:

 >   http://autobuild.buildroot.org/results/f9b/f9bbb8a6636cd3e3203b059f627aac7b1d511eb2/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
