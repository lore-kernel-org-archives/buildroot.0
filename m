From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 23:00:34 +0200
Subject: [Buildroot] [PATCH] protobuf: link with libatomic when needed
In-Reply-To: <1494880712-28989-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 15 May 2017 22:38:32 +0200")
References: <1494880712-28989-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874lwk8qkt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The protobuf library uses atomic intrinsics, so we need to link
 > against libatomic.

 > Fixes the build of protobuf on Sparc:

 >   http://autobuild.buildroot.net/results/f3d76eaebd529a61bce849e355182c60f233ed06/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
