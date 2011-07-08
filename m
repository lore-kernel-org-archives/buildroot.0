From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Jul 2011 20:07:21 +0200
Subject: [Buildroot] Feature request - pull sources from repose
In-Reply-To: <CAF++6AOsD-5==iwidP2xfQJiDiFcBzqM6FgkdD4p5THY-R1C3A@mail.gmail.com>
 (James Hanley's message of "Fri, 8 Jul 2011 12:36:55 -0400")
References: <5725744097739393062@unknownmsgid>
 <87wrfuqa4e.fsf@macbook.be.48ers.dk>
 <CAF++6AOsD-5==iwidP2xfQJiDiFcBzqM6FgkdD4p5THY-R1C3A@mail.gmail.com>
Message-ID: <87y608wsrq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hanley <jhanley@dgtlrift.com> writes:

 James> I meant to reply all - sorry Peter for the double message.
 James> I used this patch
 James> http://lists.uclibc.org/pipermail/uclibc-cvs/2011-June/029684.html
 James> with some modification - specifically where he used
 James> int nsig = _NSIG / 8;
 James> I used
 James> const int nsig = _NSIG / 8;

Ok, we have that one since Wednesday.

-- 
Bye, Peter Korsgaard
