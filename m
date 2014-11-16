From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 23:01:12 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
In-Reply-To: <20141116220244.0175cc90@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 16 Nov 2014 22:02:44 +0100")
References: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141116220244.0175cc90@free-electrons.com>
Message-ID: <87bno6erfb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Bernd Kuhls,
 > On Sun, 16 Nov 2014 18:21:04 +0100, Bernd Kuhls wrote:

 >> Please add the upstream bugtracker URL to your patch: 
 >> https://bugzilla.clamav.net/show_bug.cgi?id=11170

 > I believe Yann's patch is not an appropriate upstream solution, and a
 > configure.ac check should be added instead.

Well, you could certainly argue that a configure check would be nicer,
but Yanns' fix is atleast in line with the upstream code (it just
extends the existing glibc check in mbox.c).

-- 
Bye, Peter Korsgaard
