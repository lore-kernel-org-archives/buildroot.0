From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 10 Aug 2013 08:12:43 -0300
Subject: [Buildroot] [PATCH 1/3] busybox: set/unset CONFIG_NOMMU
In-Reply-To: <CAFRkauBPLBDR+7m7WHA0wo_NkJjN4VRQp1Jzp2tL8q6hTqC+tQ@mail.gmail.com>
References: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
 <CAFRkauBPLBDR+7m7WHA0wo_NkJjN4VRQp1Jzp2tL8q6hTqC+tQ@mail.gmail.com>
Message-ID: <5206202B.5000603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/2013 11:08 PM, Axel Lin wrote:

> Hi Gustavo,
> 
> I try to build for noMMU with below patches:
> [PATCH 1/3] busybox: set/unset CONFIG_NOMMU
> [PATCH 2/3] uclibc: set MMU usage accordingly
> 
> However, I still got ELF executable:
> $ file output/target/bin/busybox
> output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM,
> version 1 (SYSV), statically linked, stripped

Hi Axel.
It's not ready, these are patches just to fix obvious problems.
More will possibly follow unless unless i get pissed off by your
continuous one bit comments.
I already know it's still doing ELF binaries - the toolchain isn't
configured appropiately and without hardware finding the exact way of
doing so isn't easy (seems very likely that it'll require gcc patching).
Thanks and regards.
