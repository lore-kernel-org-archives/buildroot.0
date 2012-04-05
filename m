From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Apr 2012 19:52:10 +0200
Subject: [Buildroot] ZFS and buildroot
In-Reply-To: <CAC1m4Ek70-zU4uogCa2+xTEkVy=-jhRinARbEUcmYu4i0eJErg@mail.gmail.com>
 (Bademus's message of "Wed, 4 Apr 2012 01:36:47 +0200")
References: <CAC1m4Ek70-zU4uogCa2+xTEkVy=-jhRinARbEUcmYu4i0eJErg@mail.gmail.com>
Message-ID: <87398irrqt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bademus" == Bademus  <bademux@gmail.com> writes:

 Bademus> Hello,
 Bademus> I'm building home file server (based on x86 PC). How to configurate
 Bademus> ZFS (zfsonlinux.org) kernel module with buildroot?
 Bademus> Or may be FUSE zfs can be used?

We currently have neither in buildroot, but should be doable to add (we
do have fuse).

-- 
Bye, Peter Korsgaard
