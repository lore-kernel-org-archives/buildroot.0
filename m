From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 17:24:44 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <8738p5i6kq.fsf@dell.be.48ers.dk>
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
Message-ID: <20130916172444.2573614e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 16 Sep 2013 09:11:49 +0200, Peter Korsgaard wrote:

> So a bunch of non-patch files. I guess our best option is to degrade the
> "Unsupported format" check to a warning again?

Another way of seeing that is that using:

<pkg>_PATCH = some-debian-tarball

is not a good idea, and we should have a better way of handling this,
no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
