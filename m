From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 09:34:08 +0200
Subject: [Buildroot] [PATCH v6] Add defconfig for MIPS Creator ci40
In-Reply-To: <CA+V_ovvMvUecU1VqVbWY11DuaVQFj4PGx+dvQG7nvEMVe7oFhw@mail.gmail.com>
References: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
 <20170404221332.342b1fd7@free-electrons.com>
 <CA+V_ovs55OYv9CEF6EpeiG8eaRG6r4u3XE+Q3QrxpgEa5+7H-Q@mail.gmail.com>
 <20170405092900.30b8cd96@free-electrons.com>
 <CA+V_ovvMvUecU1VqVbWY11DuaVQFj4PGx+dvQG7nvEMVe7oFhw@mail.gmail.com>
Message-ID: <20170405093408.6874bd00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Apr 2017 13:01:45 +0530, abhimanyu.v at gmail.com wrote:

> I think it was mostly from the point that /tmp are usually temporary mount
> and they are always writable. I dont think there is any reason other than
> that, user can download to any writable FS or use usb-drive.
> I am trying to give some direction. Do you have suggestion to reword it?

Ideally, the bootloader image should be part of the filesystem image,
so it's easy for users to reflash their bootloader. But there's no easy
way to do that.

So just say that there is a bootloader image in output/images/, and it
can be used on the target to reflash the bootloader, and give the
command line.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
