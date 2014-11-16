From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Nov 2014 22:02:44 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
In-Reply-To: <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141116220244.0175cc90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 16 Nov 2014 18:21:04 +0100, Bernd Kuhls wrote:

> Please add the upstream bugtracker URL to your patch: 
> https://bugzilla.clamav.net/show_bug.cgi?id=11170

I believe Yann's patch is not an appropriate upstream solution, and a
configure.ac check should be added instead.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
