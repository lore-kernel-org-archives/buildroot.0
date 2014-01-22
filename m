From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 10:59:13 +0100
Subject: [Buildroot] [PATCH] package: icu: detect and add compiler
	symbol prefix to the assembly code
In-Reply-To: <CAJxxZ0OOzpH-sT5WvywjiCEBQiHT4puZsa_tyV4ZAQgNytTLew@mail.gmail.com>
 (Sonic Zhang's message of "Wed, 22 Jan 2014 17:18:13 +0800")
References: <1389006349-32377-1-git-send-email-Sonic.adi@gmail.com>
 <87y52iw7sv.fsf@dell.be.48ers.dk>
 <CAJxxZ0OOzpH-sT5WvywjiCEBQiHT4puZsa_tyV4ZAQgNytTLew@mail.gmail.com>
Message-ID: <87mwioe3ri.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:

Hi,

 >> Thanks. Has this been submitted upstream?

 > Do you mean the icu source upstream? Not yet. Where do you prefer to
 > host this patch? in buildroot or icu project?

I would very much prefer if this gets included upstream in icu.


 >> > +--- icu-51.2/source/configure       2014-01-06 17:13:20.907249812 +0800
 >> > ++++ icu-51.2.bak/source/configure   2014-01-06 17:12:57.335248659 +0800
 >> 
 >> Please adjust configure.ac and set ICU_AUTORECONF = YES instead.

 > But, there is no configure.ac file in the icu source code.

Ahh, I didn't know. Ok, then.

-- 
Bye, Peter Korsgaard
