From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Dec 2013 15:54:06 +0100
Subject: [Buildroot] [PATCH v10 7/8] package: enable jobserver for
	recursive make
In-Reply-To: <CAHkwnC9UmfJ06aYkE0ipFHCQYoHVZWnuZ0XupQsrPSt7_k8ZAA@mail.gmail.com>
 (Fabio Porcedda's message of "Fri, 20 Dec 2013 14:05:34 +0100")
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
 <87ob4cmvj1.fsf@dell.be.48ers.dk>
 <CAHkwnC9UmfJ06aYkE0ipFHCQYoHVZWnuZ0XupQsrPSt7_k8ZAA@mail.gmail.com>
Message-ID: <87fvpnk1yp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

Hi,

 >> Wouldn't it make more sense to add the '+' to MAKE / MAKE1?

 > Unfortunately that does not work, the '+' must be the first character
 > of the command line, e.g.:

Ahh, ok :/

-- 
Bye, Peter Korsgaard
