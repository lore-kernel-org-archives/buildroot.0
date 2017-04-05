From: abhimanyu.v at gmail.com <abhimanyu.v@gmail.com>
Date: Wed, 5 Apr 2017 13:01:45 +0530
Subject: [Buildroot] [PATCH v6] Add defconfig for MIPS Creator ci40
In-Reply-To: <20170405092900.30b8cd96@free-electrons.com>
References: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
 <20170404221332.342b1fd7@free-electrons.com>
 <CA+V_ovs55OYv9CEF6EpeiG8eaRG6r4u3XE+Q3QrxpgEa5+7H-Q@mail.gmail.com>
 <20170405092900.30b8cd96@free-electrons.com>
Message-ID: <CA+V_ovvMvUecU1VqVbWY11DuaVQFj4PGx+dvQG7nvEMVe7oFhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 5, 2017 at 12:59 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 5 Apr 2017 11:17:20 +0530, abhimanyu.v at gmail.com wrote:
>
> > It is just a step to copy to some temporary place to be able to flash the
> > new bootloader. I also need to update
> > bootloader version number here.
>
> Why specifically in /tmp ?
>

I think it was mostly from the point that /tmp are usually temporary mount
and they are always writable. I dont think there is any reason other than
that, user can download to any writable FS or use usb-drive.
I am trying to give some direction. Do you have suggestion to reword it?

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>

Regards
Abhimanyu V
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170405/8b8c1882/attachment.html>
