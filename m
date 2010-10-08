From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 8 Oct 2010 10:52:40 +0200
Subject: [Buildroot] buildroot not support c++ compliing
In-Reply-To: <20101008104411.7a7a2777@surf>
References: <1286511827.3703.11.camel@olyvine-desktop.logiways-sz.cn>
	<20101008091844.1afdb502@surf>
	<1286525870.3703.16.camel@olyvine-desktop.logiways-sz.cn>
	<20101008104411.7a7a2777@surf>
Message-ID: <AANLkTikXM6DCteDjN7Sw0O7-2bQWtwFLRdo=YD6bA_64@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 8, 2010 at 10:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Fri, 08 Oct 2010 16:17:50 +0800
> "olyvine.chen at logiways.com.cn" <olyvine.chen@logiways.com.cn> wrote:
>
>> STLinux's sh4-linux-
>
> Does this toolchain supports C++ ? Is this toolchain publicly available
> so that I can test and see what's wrong ?
>
> Thanks,
>
> Thomas
> --

Thomas,

There is an installation script here :

http://stlinux.com/pub/stlinux/2.3/install

Other informations related to the toolchain installation on
debian/ubuntu distros are here :

http://www.stlinux.com/install/ubuntu

There are both stlinux 2.3 and 2.4 version. I might be wrong, but I'm
pretty sure Olyvine uses the 2.3 version.
Also the installation page does not mention it, but the toolchain is
available with glibc or uclibc.

You choice :
sudo ./install all-sh4-glibc
or
sudo ./install all-sh4-uclibc

Olyvine, could give us some details about the exact version of the
toolchain you're using ?

Regards,

--
Lionel Landwerlin
