From: Atilla Filiz <atilla.filiz@gmail.com>
Date: Mon, 22 Mar 2021 12:23:18 +0100
Subject: [Buildroot] Xeon variant for x86_64 target
Message-ID: <CACTZKX66V9a2xBXnw_f7esQoWGnw99t2uwX=CaefkXPffwfPrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am preparing a config for an Intel Xeon D based target. There is no Xeon
variant available in the 2021.02 release. I am not very familiar with the
x86 family but I want to create a pro[er variant if possible.

I see the build variant selects certain flags. E.g. Atom selects
BR2_X86_CPU_HAS_MMX [=y] && BR2_X86_CPU_HAS_SSE [=y] &&
BR2_X86_CPU_HAS_SSE2 [=y] && BR2_X86_CPU_HAS_SSE3 [=y] &&
BR2_X86_CPU_HAS_SSSE3 [=y]

What else does this variant selection affect? I assume a few additional
build flags to pass on GCC? Maybe some kernel build options?

How does one go about creating a proper x86_64 variant?

-- 
Atilla Filiz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210322/0df9d150/attachment-0001.html>
