From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 22:55:51 +0100
Subject: [Buildroot] no bootloader selected ?
In-Reply-To: <CAJ2oMhJ8esBWytXGG87yCZGbW9wm5+x6OoO0Ox-+iBCZjydn0A@mail.gmail.com>
 (Ran Shalit's message of "Sun, 18 Mar 2018 23:07:28 +0200")
References: <CAJ2oMhJ8esBWytXGG87yCZGbW9wm5+x6OoO0Ox-+iBCZjydn0A@mail.gmail.com>
Message-ID: <87tvtddp5k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ran" == Ran Shalit <ranshalit@gmail.com> writes:

 > Hello,
 > Is it possible to deselect any bootloader and boot in x86 directly
 > from bios to Linux ?

On UEFI systems it is, if you enable CONFIG_EFI_STUB in your Linux
config.

 > I ask because I see in buildroot functional config that there is no
 > bootloader selected, which surprised me.

Ehh, what configuration file are you talking about exactly? Buildroot
does not enforce that you enable a bootloader if that is what you mean -
This is because there are use cases where you don't need a bootloader /
don't want to build it in Buildroot.

-- 
Bye, Peter Korsgaard
