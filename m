From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 09:55:30 +0100
Subject: [Buildroot] [PATCH] gettext: fix static build failure
In-Reply-To: <1358597185-7602-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 19 Jan 2013 09:06:25 -0300")
References: <1358597185-7602-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqv8dyil.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> When static libraries are preferred we don't build dynamic libraries so
 Gustavo> it fails on the install phase. So don't try to do it for those cases.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/651537ae1909b039e0cfc5c104ee87f93a9e5792/

Committed, thanks.

We arguably should install the .a file to the target then, but as
target-gcc is going away ..

-- 
Bye, Peter Korsgaard
