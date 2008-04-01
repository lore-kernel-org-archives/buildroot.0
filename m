From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Apr 2008 16:50:49 +0200
Subject: [Buildroot] thttpd-package more clean-up
In-Reply-To: <f90898420804010737l75ea4bbfr7fc675dd1cb8229a@mail.gmail.com>
	(Simon Pasch's message of "Tue\, 1 Apr 2008 16\:37\:39 +0200")
References: <f90898420804010737l75ea4bbfr7fc675dd1cb8229a@mail.gmail.com>
Message-ID: <87ej9pljcm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Pasch <fpasch@googlemail.com> writes:

 Simon> After sending the last patch, I realized, that the files
 Simon> package/thttpd/S90thttpd
 Simon> package/thttpd/thttpd.conf

 Simon> aren't used anymore. So they could be removed from the repository...

Thanks - Fixed in r21611.

-- 
Bye, Peter Korsgaard
