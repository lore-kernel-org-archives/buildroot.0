From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 10 Dec 2011 20:27:16 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <4EE32F27.4080805@free.fr> (Guillaume Gardet's message of "Sat,
 10 Dec 2011 11:06:31 +0100")
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
 <87y5ull8z0.fsf@macbook.be.48ers.dk>
 <87ty59l5y1.fsf@macbook.be.48ers.dk>
 <CAHUNapRt1=nyUK=o__fUDk2JQVn66F1ikwBF+jarECg9=CESSg@mail.gmail.com>
 <4EE32F27.4080805@free.fr>
Message-ID: <87pqfwkz1n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Gardet <guillaume.gardet@free.fr> writes:

 Guillaume> Le 10/12/2011 00:27, Trevor Woerner a ?crit :
 >> On Fri, Dec 9, 2011 at 5:45 PM, Peter Korsgaard<jacmet@sunsite.dk>  wrote:
 Peter> I'll try the specific .config next.
 >>> 
 >>> Which just finished building here without any problems and no
 >>> usr/lib64. Any ideas?
 >> I too am not able to reproduce this build failure.

 Guillaume> It was not a real failure, just a directfb build without PNG
 Guillaume> support. If you want a build failure, try to add fbgrab.

Builds here fine. I also don't get any usr/lib64 dirs, so there must be
something special about your setup.

-- 
Bye, Peter Korsgaard
