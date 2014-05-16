From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 16:08:08 +0200
Subject: [Buildroot] [PATCH] jack2: force host-python dependency for waf
	build-system
In-Reply-To: <1400064376-31656-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 14 May 2014 12:46:16 +0200")
References: <1400064376-31656-1-git-send-email-s.martin49@gmail.com>
Message-ID: <8738g9sto7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > jack2 uses Waf 1.6.11. The waf configure program combines a part of
 > python script with a compiled blob. According to Waf documentation,
 > waf currently supports python interpreter from version 2.3 to 3.1.

 > However, Buildroot provides python-3.4. So, let's uses host python2
 > interpreter for building jack2.

 > This patch also cleanup whitespace, replacing wrongly used spaces with
 > tabs.

 > Fixed:
 >   http://autobuild.buildroot.net/results/913/913bb1836076be9f201bf6641c7614708d6916bc/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
