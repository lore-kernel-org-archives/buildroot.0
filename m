From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 23:11:27 +0200
Subject: [Buildroot] [PATCH] bison: fix docs build breakage
In-Reply-To: <1380745292-9743-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Oct 2013 17:21:32 -0300")
References: <1380745292-9743-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738ojpedc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Building docs running the binary itself to see if docs need to be
 Gustavo> changed is somewhat skippy. Disable it. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/e8a/e8a960f38e66f31355af733e510002d45052b541/

The bison bump also seems to have broken E.G. gstreamer:

http://autobuild.buildroot.net/results/af0/af0c1f66a05ff08bf10d2abaef6aab6421d7a62e/build-end.log

With 0.10 being end of life, upstream will most likely not fix
this. Care to take a look?

-- 
Bye, Peter Korsgaard
