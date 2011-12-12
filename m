From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Dec 2011 10:15:04 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <4EE5B9E9.40404@free.fr> (Guillaume Gardet's message of "Mon, 12
 Dec 2011 09:23:05 +0100")
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
 <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
 <4EE5B9E9.40404@free.fr>
Message-ID: <87hb16up5z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Gardet <guillaume.gardet@free.fr> writes:

 Guillaume> Hi,
 Guillaume> I finally found the problem. It comes from the file /usr/share/site/x86_64-unknown-linux-gnu which deals with lib64 and does not support arm.
 Guillaume> A bug report with a patch has been submitted on openSUSE bugzilla :
 Guillaume> https://bugzilla.novell.com/show_bug.cgi?id=736143

Ahh. I guess the best approach in buildroot is simply to unset
CONFIG_SITE.

Thanks.

-- 
Bye, Peter Korsgaard
