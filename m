From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jan 2013 21:20:19 +0100
Subject: [Buildroot] Squashfs boot
In-Reply-To: <50FED12F.4050209@petroprogram.com> ("Stefan =?utf-8?Q?Fr?=
 =?utf-8?Q?=C3=B6berg=22's?= message
 of "Tue, 22 Jan 2013 19:49:35 +0200")
References: <CAN_xxrWTp21-a-jD7x11yJa6ghM=C=ON2h_bx_is1iFhEkE0bQ@mail.gmail.com>
 <CAN_xxrUK+_=8ETwqCG=Q-5BhDbNCVR-yr9d_2uCbnJrqcg2eow@mail.gmail.com>
 <50FE8914.30909@petroprogram.com>
 <CAN_xxrVD=Tq=ekME-jdHKRzyUwXk0PMocQX9mrxxcgjZQ8SYqA@mail.gmail.com>
 <50FED12F.4050209@petroprogram.com>
Message-ID: <87d2wx3r7g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> It's true that you can use squashfs to compress whole system
 Stefan> but even in that case you have to make your own init script
 Stefan> that will take care of all the magic of mounting.  And because
 Stefan> squashfs is read-only filesystem then it get's more trickier
 Stefan> because you have to take care of yourself of all those /tmp and
 Stefan> /var/log etc.. directories that need to store temporarily
 Stefan> stuff.

Read only rootfs (with /tmp and /var/log in tmpfs) should work out of
the box with buildroot, and I've using it for several projects.

-- 
Bye, Peter Korsgaard
