From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 22:49:58 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130916172444.2573614e@skate> (Thomas Petazzoni's message of
 "Mon, 16 Sep 2013 17:24:44 +0200")
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
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
 <20130916172444.2573614e@skate>
Message-ID: <87d2o8h4p5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Mon, 16 Sep 2013 09:11:49 +0200, Peter Korsgaard wrote:

 >> So a bunch of non-patch files. I guess our best option is to degrade the
 >> "Unsupported format" check to a warning again?

 Thomas> Another way of seeing that is that using:

 Thomas> <pkg>_PATCH = some-debian-tarball

 Thomas> is not a good idea, and we should have a better way of handling this,
 Thomas> no?

Arguably yes, but this used to work so some people might be relying on
it - So I change it back to only warn about these files.

Nevertheless, it would be good if we could come up with a better way of
handling these Debian patches.

-- 
Bye, Peter Korsgaard
