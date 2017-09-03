From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 09:16:37 +0200
Subject: [Buildroot] [PATCH] package/sysdig: fix missing curlbuild
 include
In-Reply-To: <CA+TH9Vkr+B6-1f0QUWP98UJxbnP+c-V=htKy9byKwF8-gzzZGA@mail.gmail.com>
References: <1504281081-11201-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170902231728.2be2989f@windsurf.lan>
 <CA+TH9Vkr+B6-1f0QUWP98UJxbnP+c-V=htKy9byKwF8-gzzZGA@mail.gmail.com>
Message-ID: <20170903091637.06725492@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list in Cc.

On Sun, 3 Sep 2017 00:33:27 +0200, Angelo Compagnucci wrote:

> Also if the patch is not mine? It's backported directly from the mainline
> source code.

Signed-off-by does not mean "I am the author of the patch", but "I am
passing the patch". From the Linux kernel Submitting Patches
documentation:

Developer's Certificate of Origin 1.1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.

then you just add a line saying::

        Signed-off-by: Random J Developer <random@developer.example.org>

You are in case (c), and the chain of Signed-off-by allows to trace how
the code ended up in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
