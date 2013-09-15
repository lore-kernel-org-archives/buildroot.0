From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 22:09:45 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130915141314.GA18166@harvey.netwinder.org> (Ralph Siemsen's
 message of "Sun, 15 Sep 2013 10:13:14 -0400")
References: <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
Message-ID: <8738p5lud2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ralph" == Ralph Siemsen <ralphs@netwinder.org> writes:

 Ralph> The "patch" command returns an error code only if patches fail
 Ralph> to apply. Therefore the pipleline "cat <patchfile> | patch ..."
 Ralph> does not fail, even if <patchfile> is missing. Fix this by
 Ralph> adding an explicit check for patch file existence.

 Ralph> Based on feedback from buildroot mailing list, also change the
 Ralph> existing check for unsupported patch format into a fatal error.
 Ralph> ---

 Ralph> v1. original
 Ralph> v2. error on unsupported patch formats
 Ralph> v3. explicit exit calls

Committed, thanks.

You forgot to add your 'Signed-off-by' on the patch. I've added it for
you, hopefully that is OK?

-- 
Bye, Peter Korsgaard
