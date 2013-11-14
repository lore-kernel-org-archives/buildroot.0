From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Nov 2013 17:55:34 +0100
Subject: [Buildroot] qt5base: Regression with 2013.11_rc1 or HEAD
In-Reply-To: <CAAEAJfA07aJ29cyQfXGb-rCjD7HfBPbwbpodb9iHSk+U5MG+aQ@mail.gmail.com>
 ("Ezequiel =?utf-8?Q?Garc=C3=ADa=22's?= message of "Thu, 14 Nov 2013
 14:42:54 -0200")
References: <CAAEAJfA07aJ29cyQfXGb-rCjD7HfBPbwbpodb9iHSk+U5MG+aQ@mail.gmail.com>
Message-ID: <87d2m22a9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garc?a <ezequiel@vanguardiasur.com.ar> writes:

 > Hi Peter, Fatih,
 > One of the Qt5 patches no longer applies. Mind taking a look?

Yeah, that unfortunately got broken by one of the last patches before
-rc1. It is fixed in git by be930801a26193024.

I will put out -rc2 this weekend.

-- 
Bye, Peter Korsgaard
