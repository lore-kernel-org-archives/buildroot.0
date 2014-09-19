From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Sep 2014 23:22:20 +0200
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.10p3
In-Reply-To: <1411074564-28932-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 18 Sep 2014 18:09:24 -0300")
References: <1411074564-28932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjdv2tmb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also add hashes, kill some whitespace and correct the license type
 > (ICS->ISC).
 > Enable $EDITOR to point to the right editor for visudo since it normally
 > expects /usr/bin/vi which in busybox-world is /bin/vi (and some people
 > might want to use other editors like the operating system sized one).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
