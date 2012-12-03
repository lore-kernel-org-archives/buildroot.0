From: Charles Manning <cdhmanning@gmail.com>
Date: Tue, 4 Dec 2012 11:00:48 +1300
Subject: [Buildroot] How to handle modularity in buildroot?
Message-ID: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

Ok, first off... I must absolutely congratulate and thank everyone for
a really useful build system.

Until now I had been using openembedded to build smaller file systems
for embedded systems. OE is way overkill for most embedded systems and
is like trying to use a chainsaw to cut butter. Buildroot is much
faster than OE and is way easier to navigate.

There are a few things I could do in OE that I am struggling with in
buildroot - no doubt mainly due to my learner status. One of these is
handling modularity.

Is there an easy way to have modular/hierarchical projects? For
example I would like to have a base file system that holds common
stuff but then have variants (eg. production vs development).

In OE this is easy: just create a "basic system" package which is
included in the recipes for each of the variants.

How would this be tackled in buildroot?

Thanks

Charles
