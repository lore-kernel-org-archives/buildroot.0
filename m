From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 11:28:27 +0100
Subject: [Buildroot] [PATCH 2/2] ruby: explicitly disable SSP support
In-Reply-To: <1447100711-16463-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 9 Nov 2015 21:25:11 +0100")
References: <1447100711-16463-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1447100711-16463-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878u66qhbo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The SSP support checks of the Ruby configure script do not do a full
 > link, and therefore don't properly detect if SSP support is fully
 > functional or not, which causes some build failures if the compiler
 > supports -fstack-protector but the C library does not provide the SSP
 > implementation.

 > To avoid this, we explicitly tell ruby if SSP support is available or
 > not.

 > Fixes:

 >   http://autobuild.buildroot.net/results/001/00154b0142f51c197d5d53ae36f7adc4f8250d9d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
