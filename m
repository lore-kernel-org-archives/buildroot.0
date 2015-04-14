From: Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 14 Apr 2015 19:28:19 -0400
Subject: [Buildroot] How to allocate 100% of memory to /tmp?
Message-ID: <CALoSW658=RKf+o=X4ND03U5CiH83poVTPrU+uGDAJPkKtXzUHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are working on a recovery system using Buildroot that operates
solely in memory. Some data we send over is 1-2GB in size so we'd like
to allocate all of the memory to /tmp. I'm not sure where the setting
is to change this but on a system with 2 GB of memory for example,
/tmp is given 1 GB and /dev/shm the other 1 GB. How do I map this
differently in a safe manner? Or is this normal behavior? Thanks!
