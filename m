From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:10:15 +0200
Subject: [Buildroot] [PATCH] usbutils: bump to version 012
In-Reply-To: <5f544ab862e6e9b32b7b08538fb7e7fcbfa91f6e.1559042765.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 May 2019 14:26:05 +0300")
References: <5f544ab862e6e9b32b7b08538fb7e7fcbfa91f6e.1559042765.git.baruch@tkos.co.il>
Message-ID: <877ea7386w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop the patch adding license files since they are now in the tarball.
 > On the other hand, a configure script is no longer distributed with the
 > tarball. Upstream considers that to be "safer":

 >   https://www.spinics.net/lists/linux-usb/msg179970.html

 > Don't remove the usb-devices script; it doesn't needs bash anymore.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
