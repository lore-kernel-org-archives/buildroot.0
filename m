From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue, 22 Jan 2013 22:09:17 +0100
Subject: [Buildroot] Boost integration
Message-ID: <CAKvQZ_1g6_KHpdyYQ6H-pk6T5gx-qsW6SvaF7XBb2JJCSf7cLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I created a package for Boost on my personnal repo. Are you interested
in getting this mainlined ?

One of the most challenging part of it is the version management as
Boost has a quite high frequency delivery rate, has many independant
librairies (so it requires an important Config.in job) and that they
changed their buildsystem recently (1.45.0).

I have already a package working for 1.40.0 to 1.44.0 that I get from
someone with some librairies.
