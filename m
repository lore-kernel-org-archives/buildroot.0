From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Mar 2015 22:26:55 +0100
Subject: [Buildroot] [PATCH] uclibc: mask uclibc-ng for xtensa
In-Reply-To: <1425415991-20530-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Mar 2015 17:53:11 -0300")
References: <1425415991-20530-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zj7tsrfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Is broken like plain uClibc, fixes:
 > http://autobuild.buildroot.net/results/77f/77fe89d358a90f5167e58bedb73495d7ee9a7f5d/

So why do we have:

commit 060125b4fed11458288b14fbd2d49e1c12eb11df
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Sat Feb 14 22:01:07 2015 +0100

    uclibc: enable Xtensa NPTL support with uClibc-ng

Then? Presumably something was working when this was done?

-- 
Bye, Peter Korsgaard
