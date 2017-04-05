From: abhimanyu.v at gmail.com <abhimanyu.v@gmail.com>
Date: Wed, 5 Apr 2017 13:06:34 +0530
Subject: [Buildroot] [PATCH v6] Add defconfig for MIPS Creator ci40
In-Reply-To: <20170405093408.6874bd00@free-electrons.com>
References: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
 <20170404221332.342b1fd7@free-electrons.com>
 <CA+V_ovs55OYv9CEF6EpeiG8eaRG6r4u3XE+Q3QrxpgEa5+7H-Q@mail.gmail.com>
 <20170405092900.30b8cd96@free-electrons.com>
 <CA+V_ovvMvUecU1VqVbWY11DuaVQFj4PGx+dvQG7nvEMVe7oFhw@mail.gmail.com>
 <20170405093408.6874bd00@free-electrons.com>
Message-ID: <CA+V_ovt7pXuPFB-UQa-PWx9+OEnZNGuSW5MuhxpP1dBwuUNhqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 5, 2017 at 1:04 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 5 Apr 2017 13:01:45 +0530, abhimanyu.v at gmail.com wrote:
>
> > I think it was mostly from the point that /tmp are usually temporary
> mount
> > and they are always writable. I dont think there is any reason other than
> > that, user can download to any writable FS or use usb-drive.
> > I am trying to give some direction. Do you have suggestion to reword it?
>
> Ideally, the bootloader image should be part of the filesystem image,
> so it's easy for users to reflash their bootloader. But there's no easy
> way to do that.
>
> So just say that there is a bootloader image in output/images/, and it
> can be used on the target to reflash the bootloader, and give the
> command line.
>
> Ok, looks good. Thankyou!


> Best regards,
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170405/97bc21f3/attachment.html>
