From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 15:42:30 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130916123623.GA24501@harvey.netwinder.org> (Ralph Siemsen's
 message of "Mon, 16 Sep 2013 08:36:23 -0400")
References: <5228425A.7090502@lucaceresoli.net> <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk>
 <20130916123623.GA24501@harvey.netwinder.org>
Message-ID: <87pps8hohl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ralph" == Ralph Siemsen <ralphs@netwinder.org> writes:

 Ralph> On Sun, Sep 15, 2013 at 10:09:45PM +0200, Peter Korsgaard wrote:
 >> 
 >> Committed, thanks.
 >> 
 >> You forgot to add your 'Signed-off-by' on the patch. I've added it for
 >> you, hopefully that is OK?

 Ralph> Yes, that is fine. What is the exact syntax/capitalization for this? The
 Ralph> current buildroot manual lists a couple of slight variations.

The format used by git format-patch -s / the Linux kernel - E.G:

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

I'll fix the manual to use this everywhere, thanks.

-- 
Bye, Peter Korsgaard
