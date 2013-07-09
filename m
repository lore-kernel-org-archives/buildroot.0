From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jul 2013 17:14:04 +0200
Subject: [Buildroot] Buildroot compilation using uClibc and activating
 bluez
In-Reply-To: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9A50@EXDCVYMBSTM005.EQ1STM.local>
References: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
 <20130709125037.0a4e0077@skate>
 <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9A50@EXDCVYMBSTM005.EQ1STM.local>
Message-ID: <20130709171404.1fc94ea6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien COUVRAND,

On Tue, 9 Jul 2013 16:36:15 +0200, Julien COUVRAND wrote:
> Thanks Thomas
> I am going to check it.

Please don't reply to me directly: keep the list Cc'ed.

Now that my network connection is working a little bit better, the
Blackfin guys indeed have a noMMU patch for D-Bus, at
http://blackfin.uclinux.org/git/?p=buildroot;a=blob;f=package/dbus/dbus-nommu.patch;h=bd1cf4c00b454634648a7d074f2f7bda009b6581;hb=HEAD.
It'd be great if you could test it, clean it up, and submit it to
Buildroot.

Just curious, which noMMU architecture are you working on?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
