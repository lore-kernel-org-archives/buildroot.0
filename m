From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 15:15:30 +0200
Subject: [Buildroot] [PATCH] jamvm: add patch to fix musl build
In-Reply-To: <1464268095-19912-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 26 May 2016 15:08:15 +0200")
References: <1464268095-19912-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y46x55al.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Add a patch available from JamVM's bug tracker to fix the build with
 > the musl C library. The build was verified with the musl and uClibc C
 > libraries.

 > Fixes:

 >   http://autobuild.buildroot.org/results/8292973e9f6f2971d090f02f24d11a31709254cf/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
