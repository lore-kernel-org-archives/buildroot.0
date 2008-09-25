From: Ram kumar <ramkumar.research@gmail.com>
Date: Thu, 25 Sep 2008 16:24:21 +0530
Subject: [Buildroot] undefined macro: AM_PROG_LIBTOOL (buildroot failure)
In-Reply-To: <87k5gtyb0x.fsf@macbook.be.48ers.dk>
References: <6306c640805281409v1bf5384ag2c1353fd4aead298@mail.gmail.com>
	<87k5gtyb0x.fsf@macbook.be.48ers.dk>
Message-ID: <6306c640809250354o4f1d3555v6c6d5382fc10d461@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

On Fri, Jun 13, 2008 at 2:19 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Ram" == Ram kumar <ramkumar.research@gmail.com> writes:
>
>  Ram> hi,
>
>  Ram>      Iam trying to build a development environment using
>  Ram> buildroot for my atmel eval kit (AT91SAM9260 ek).I follow the
>  Ram> instruaction in the website http://
>  Ram> www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRoot. But my
>  Ram> buildroot fails when it is trying to build libusb.
>
>  Ram> First the buildroot throws 404 file not found error since
>  Ram> http://ftp.debian.org /pool/main/libu/libusb/ doesn't have
>  Ram> libusb_0.1.12-9.diff.gz which buildroot looks for......so i
>  Ram> edited the /buildroot/package/libusb/libusb.mk file to download
>  Ram> libusb_0.1.12-11.diff.gz which is present in the FTP server.
>
> libusb missed a dependency on host-libtool and patch version bumped.
> Fixed in r22311-r22313.
>

I have buildroot downloaded from
http://buildroot.uclibc.org/downloads/snapshots/

Please guide me to download the above patch and apply ???

Regards,
Ram
