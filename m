From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 26 Jan 2020 09:01:20 +0100
Subject: [Buildroot] Package can create
 LINUX_FINAL_RECURSIVE_DEPENDENCIES
In-Reply-To: <20200126075046.GG32369@scaer>
References: <CAEyMn7b_ESWcZ8ZBQAVYHxyXNQHrQUGx--8QGD1C6jj+F1=2gA@mail.gmail.com>
 <20200126075046.GG32369@scaer>
Message-ID: <CAEyMn7bVMyR1AF72UeGh64JnQwEo7krRxmN4pBA4X5mo+NeWpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> However, if your package provides a kernel patch, why does it not patch
> the kernel with your new module to begin with, and have the module built
> as part of the kernel build? After all, that's the whole point of linux
> extensions: inject new code in the kernel build process.

We just integrate this code from an external supplier. Both the kernel
module and the patches. And by doing this in that way we don't have to
create the patch for the module. But I have check.

Thank you
