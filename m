From: hartleys <hartleys@visionengravers.com>
Date: Tue, 17 Jun 2008 22:56:06 -0400
Subject: [Buildroot] Problem building usbutils
In-Reply-To: <dba6c0830806171858v2f2ddb4cl3d260b0f64a1892c@mail.gmail.com>
References: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com>
	<dba6c0830806171858v2f2ddb4cl3d260b0f64a1892c@mail.gmail.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182818@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Conrad Parker wrote:
> >
> > 2) configure for usbutils outputs error: get libusb 0.1.8 or newer
Not 
> > sure how to fix this one. The libusb in buildroot is 0.1.12. It
built 
> > fine and the library is in my build_arm/staging_dir/usb/lib
directory. 
> > For some reason it's not being found. Can anyone offer so insite on 
> > what I might have setup wrong?
>
> edit the version in package/libusb/libusb.mk, and try again.
>
> If it works, send a patch to this list :-)
>

I'm not sure that will fix the problem. The version in buildroot is
already newer than what libusb is looking for.

I think the problem is the files in build_arm/staging_dir/usr/lib are
not being seen during the configure stage.

I'm out of here for today. I'll try your suggestion tommorrow.

Thanks,
Hartley
