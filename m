From: Stefano Canepa <sc@linux.it>
Date: Mon, 13 Jun 2011 10:04:15 +0200
Subject: [Buildroot] New to buildroot with problems adding nut
Message-ID: <BANLkTi=x+eEp6cf9dTrp6O38YMhrSjRjGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm new to buildroot, I'm using it to build an initramfs based
distribution to deploy an application developed by my firm.

Our application needs nut to check the UPS connected via USB to our
computer, if I run our previous installation, that is based on RedHat
7, nut works, if I run the newly created distribution, nut is not
capable to found HID device. I check nut compile options on RedHat 7
and they are the same I passed to busybox. I tried with nut 2.0.5 (the
same distributed with RedHat 7) and with last tarball. The result is
the same HID ups not found. What do I need to enable to have hid
working properly? I checked kernel config but I was unable to find out
something usefull.

TIA
Stefano Canepa

PS: sorry for my bad English

-- 
Stefano Canepa aka sc: sc at linux.it - http://www.stefanocanepa.it
Three great virtues of a programmer: laziness, impatience and hubris.
Le tre grandi virt? di un programmatore: pigrizia, impazienza e
arroganza. (Larry Wall)
