From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 22:50:48 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130916124612.GB24501@harvey.netwinder.org> (Ralph Siemsen's
 message of "Mon, 16 Sep 2013 08:46:12 -0400")
References: <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
 <20130916124612.GB24501@harvey.netwinder.org>
Message-ID: <878uywh4nr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ralph" == Ralph Siemsen <ralphs@netwinder.org> writes:

 >> So a bunch of non-patch files. I guess our best option is to degrade the
 >> "Unsupported format" check to a warning again?

 Ralph> Hmm, none of the packages I regularly build have used this feature.

 Ralph> Going back to a warning would be a simple fix. The other option would
 Ralph> be to expand the tarballs and extract only the patches directory.
 Ralph> I'm not sure which option is better...

I've changed it back to just warn as that was the simplest to
do - Thanks.

-- 
Bye, Peter Korsgaard
