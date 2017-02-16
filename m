From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 15:24:09 +0100
Subject: [Buildroot] [PATCH] trousers: disable on ARC
In-Reply-To: <1487197241-31996-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 15 Feb 2017 23:20:41 +0100")
References: <1487197241-31996-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bmu2gqnq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This package has been failing to build on ARC due to a toolchain bug
 > since December 2015, causing a total of 168 build failures. Therefore,
 > let's disable this package for now, until the toolchain issue gets
 > resolved.

 > Fixes^Wavoids:

 >   http://autobuild.buildroot.net/results/e65d1d7c5a4dd4616167cfe2aa938be6af139602/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
