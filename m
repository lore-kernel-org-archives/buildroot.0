From: Mitch Davis <mjd+buildroot@afork.com>
Date: Wed, 15 Sep 2010 14:22:29 +1000
Subject: [Buildroot] Access usb devices from buildroot
In-Reply-To: <201009121355.55893.gzmorell@gmail.com>
References: <AANLkTimDsQD=fzYMzVrFxEO8NUYnqQqCx-ZGa-0NH3Ws@mail.gmail.com>
	<201009121355.55893.gzmorell@gmail.com>
Message-ID: <AANLkTi=H5X4PuwaEiZ156_NiKO3tghX6fRe6c=koAh=R@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 12, 2010 at 9:55 PM, Francisco Gonzalez Morell
<gzmorell@gmail.com> wrote:
> On Domingo 12 Septiembre 2010 08:37:46 Santi L?pez escribi?:
>>
>> I have a doubt about the usb devices under buildroot.
>>
>> But I can?t mount this usb stick for see other partitions or another stick
>> in other usb port.
>>
> You must enable usb in the kernel. So reconfigure your kernel and check if it
> is enabled. Also check that the filesystem you use in the usb is enabled (vfat
> or other). Finally use mdev.
> This link may be very useful:
> http://free-electrons.com/doc/mdev-lab.pdf

Might also be useful to compile and run the "lsusb" program on your target.

  Packages -> Hardware Handling -> usbutils

Mitch.
