From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Oct 2014 15:49:23 -0300
Subject: [Buildroot] SERIOUS bug in coreutils / cut command
In-Reply-To: <CAKat-EbixBqGzvLhR_utUyWKTknWF3S7=TNqfJJai1JfgOohkQ@mail.gmail.com>
References: <CAKat-EbixBqGzvLhR_utUyWKTknWF3S7=TNqfJJai1JfgOohkQ@mail.gmail.com>
Message-ID: <5447FC33.4060007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2014 03:06 PM, Ray Cordova wrote:

> Hello,
> 
> echo "word1 word2 word3" | cut -d' ' -f1
> 
> word1
> 
> echo "word1 word2 word3" | cut -d' ' -f2
> 
> wword2 <-- ??!?!??
> 
> Yes, it really is 'wword2'.
> 
> echo "word1 word2 word3" | cut -d' ' -f3
> 
> word3
> 
> This is the September 1st, 2014 release. Coreutils 8.22. Two different
> builds, same versions, same bug.

Hi.
Works fine for me with latest git (same coreutils) using the
qemu-arm-versatile sample defconfig with the latest available external
toolchain.
How about a little more detail of architecture, toolchain and so on?
(i.e. savedefconfig defconfig)
Regards.
