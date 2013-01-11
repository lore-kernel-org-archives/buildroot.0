From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 11 Jan 2013 16:34:51 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <50F02D70.9080406@je-eigen-domein.nl>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
 <50F02D70.9080406@je-eigen-domein.nl>
Message-ID: <CAGduivzosrcXAVmW3FN0oOEyMEWFeULwg+fDfnV6JR5OOM3AbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 11, 2013 at 4:19 PM, Floris Bos <bos@je-eigen-domein.nl> wrote:
> On 01/11/2013 02:17 PM, Maxime Hadjinlian wrote:
>>
>>      - Add 'kernel=zImage' in config.txt (without quotes).
>
>
> Perhaps consider making that the default in package/rpi-firmware/config.txt
I though about this but since kernel.img is the default for the
RaspberryPi, I wanted to keep the config.txt as vanilla as possible.
Since it's pretty easy to rename the zImage into kernel.img with a
postbuild script, the end users has a choice.
>
> So that one can create a working Raspberry Pi image by just copying the
> files from target to a FAT formatted SD card without having to edit or
> rename anything.
You're absolutely right.
I'm not sure what to do here, I'll follow what the mailing will say.
>
>
> Yours sincerely,
>
> Floris Bos
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
