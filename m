From: z4ziggy <z4ziggy@gmail.com>
Date: Wed, 6 Jun 2007 05:35:53 +0300
Subject: [Buildroot] problem with openssh
In-Reply-To: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
Message-ID: <e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i found a fix for openssh, and i might try it with samba as well.
although its not a good fix (imo) but it works. i simply added
"--static" to LDFLAGS in openssh.mk

if someone has a better way to fix this, please enlighten me.

im sure many people here don't have a problem with openssh, and thats
why there were no replies for this problem. however - it would be
appreciated if others could assist for those of us who do have a
problem. overall, it will contribute to both the community and for
future users who might have the same problem.

Blessings,
Elia Yehuda.
