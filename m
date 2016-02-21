From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Sun, 21 Feb 2016 13:45:58 +0100
Subject: [Buildroot] state of olimex_imx233_olinuxino_defconfig
In-Reply-To: <56C9ABC4.1070506@zacarias.com.ar>
References: <CAPiYbRL+v9QK+cK1D+kmyPx58wx8ehmZVWGDQHRTzRe5=diHfg@mail.gmail.com>
 <87egc7c7y8.fsf@dell.be.48ers.dk> <56C9ABC4.1070506@zacarias.com.ar>
Message-ID: <CAPiYbRL+wYkaWNyK4hUC7teSvSkapktbvH-ugvfAowY4AERqhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 February 2016 at 13:21, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> *snip*
> Hi All.
> Unfortunately i don't have an olinuxino in my hands any more.
> It's very likely bootlets isn't happy with newer toolchain components -
> it's known to be somewhat fragile in that aspect, so if someone wants to
> update the defconfig to use uboot that would be great.
> That wasn't a viable option when i added it since it didn't work vanilla.
> Regards

Hi,

Ok, I also prefer the saner approach using u-boot. I'll send a patch to
update defconfig, readme.txt and drop the bootlets patches.

Thanks, Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160221/45395bd7/attachment.html>
