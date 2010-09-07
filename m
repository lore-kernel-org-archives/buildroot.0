From: Mitch Davis <mjd+buildroot@afork.com>
Date: Wed, 8 Sep 2010 09:57:06 +1000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <29641601.post@talk.nabble.com>
References: <29591683.post@talk.nabble.com> <29641601.post@talk.nabble.com>
Message-ID: <AANLkTinjwnU=HF0SzR6PXrk6=WDd1apLd1DeBk06uobn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 8, 2010 at 2:58 AM, JNY <jny0@hotmail.com> wrote:
>
>> Out of curiosity, a USB flash device, or CF, or NAND flash, or ?
>
> Not sure about the USB stick, but the flash device (see below) on the target
> is NAND.

Ok.  And is this the same device you referred to as "hda"?

>>> I don't have a file called rootfs.ext2. ?I have the following files:
>>> rootfs.i486.tar
>>> rootfs.i486.tar.bz2
>
>>Which of these files are you transferring to the flash device, and how?
> I'm transfering the bzImage file to the flash device, and referencing it
> with grub.

bzImage is the kernel file, and I didn't ask you about it.  I'm asking
about your filesystem.

The rootfs files contain your root filesystem.  Can you tell us
clearly what you're doing to set up the root filesystem on your
device?

Mitch.
