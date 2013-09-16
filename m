From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 22:57:22 +0200
Subject: [Buildroot] [PATCH v3] apply-patches.sh: detect missing patches
In-Reply-To: <20130916205147.GH3293@free.fr> (Yann E. MORIN's message of "Mon, 
 16 Sep 2013 22:51:47 +0200")
References: <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
 <20130915133709.GA16826@harvey.netwinder.org>
 <20130915141314.GA18166@harvey.netwinder.org>
 <8738p5lud2.fsf@dell.be.48ers.dk> <8738p5i6kq.fsf@dell.be.48ers.dk>
 <20130916172444.2573614e@skate> <87d2o8h4p5.fsf@dell.be.48ers.dk>
 <20130916205147.GH3293@free.fr>
Message-ID: <874n9kh4ct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Arguably yes, but this used to work so some people might be relying on
 >> it - So I change it back to only warn about these files.
 >> 
 >> Nevertheless, it would be good if we could come up with a better way of
 >> handling these Debian patches.

 Yann> What about extracting the tarballs and only applying patches if the
 Yann> filename contains (or end up with) '.patch' ?

I'm fairly sure that atleast some Debian packages use .diff. We could
presumably get it to work, but it feels a bit fragile / complicated to me.

-- 
Bye, Peter Korsgaard
