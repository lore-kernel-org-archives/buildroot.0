From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 11:07:32 +0200
Subject: [Buildroot] [PATCH 2/2] kmod: needs to autoreconf
In-Reply-To: <1412936897-8478-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 10 Oct 2014 07:28:17 -0300")
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
 <1412936897-8478-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhol1wrv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/7a7/7a70b179f17070d0a0883f71c60030dd7d8a9102/
 > Didn't see widespread failure because it autoreconfed on its own just
 > fine if autotools infra was already present.
 > And didn't work before the automake patch with AUTORECONF=YES because of
 > an older gtk-doc.m4

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
