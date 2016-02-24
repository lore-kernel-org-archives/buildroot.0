From: Patrick Doyle <wpdster@gmail.com>
Date: Wed, 24 Feb 2016 14:30:58 -0500
Subject: [Buildroot] Why not perform a shallow clone?
Message-ID: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I'm sitting here watching my buildroot make do a complete clone of
the Linux kernel, where I have told it that I want a specific sha1
commit and I started wondering...

Why not do a shallow clone?

Has it been tried?  Is it a bad idea?

--wpd
