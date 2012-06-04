From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jun 2012 23:12:53 +0200
Subject: [Buildroot] [PATCH 1/1] webrtc-audio-processing: disable
	unsupported target architectures
In-Reply-To: <1338835711-3824-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Mon, 4 Jun 2012 20:48:31 +0200")
References: <1338835711-3824-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87y5o2rdbe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Currently, webrtc-audio-processing only provides support for the following
 Samuel> architectures (see src/typedefs.h from the source directory):
 Samuel> - x86_64
 Samuel> - i*86
 Samuel> - armel

 Samuel> Fixes http://autobuild.buildroot.org/results/ff777bb06eddafa71327015e1d39fe911c1439d8

Committed, thanks.

-- 
Bye, Peter Korsgaard
