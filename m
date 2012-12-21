From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 21 Dec 2012 16:36:25 +0100
Subject: [Buildroot] inittab for different systems
Message-ID: <CAGm1_kucdX-CyXwmxN_A_pBO0qqX5+Z2gS=CrsiYsJ-f4XsxAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have two systems that use DT and thus can share one uImage. I'd like
to use one rootfs image for both. How do I configure console in
inittab, so that it can deal with different systems (one has ttyO2 the
other ttyO3 as console)?

Yegor
