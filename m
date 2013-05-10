From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 May 2013 20:39:59 +0200
Subject: [Buildroot] [PATCH 1/2] hplip: needs toolchain with threads
	support
In-Reply-To: <1368138122-5950-1-git-send-email-gilles.talis@gmail.com> (Gilles
 Talis's message of "Thu, 9 May 2013 15:22:01 -0700")
References: <1368138122-5950-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87wqr63chs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> hplip uses libusb that requires a toolchain with threads support
 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/12fb9bb8c93c1cc1f93ba8e15558d1630f2e7c3d

Sorry, I've already applied Gustavo's patch fixing the same issue.

-- 
Bye, Peter Korsgaard
