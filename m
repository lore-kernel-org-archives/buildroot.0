From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Thu, 8 Oct 2009 12:21:53 +0530
Subject: [Buildroot] Qtopia
In-Reply-To: <20091007185401.38976.qmail@f6mail-144-154.rediffmail.com>
References: <20091007185401.38976.qmail@f6mail-144-154.rediffmail.com>
Message-ID: <630286c70910072351x52af1dc2t1095cc1620174dc5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ravi

Donno much about qtopia.

But qt-embedded-linux-opensource-src-4.5.2 ,downloaded and compiled
separately works for me on buildroot rfs system  using
arm-linux-uclibcgnueabi- toolchain.

regards

Nataraj

On Thu, Oct 8, 2009 at 12:24 AM, Ravi <phulsundar_ravi@rediffmail.com>wrote:

> Dear All,
>
> I'm trying to use buildroot for my project where I need GUI interface.
>
> I decided to use qtopia.
>
> But while compiling, it shows following errors
>
> bash: ./build_i386/qt-embedded-linux-opensource-src-4.4.3/bin/qmake: No
> such file or directory
>
> But the file exist at same location.
>
> when I run following command
> $file qmake: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
> dynamically linked (uses shared libs), not stripped
>
> That means qmake cannnot run on my machine, It is compiled for my target
> instead of my machine.
>
> What should I do please help me
>
> Ravi
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091008/eef9e798/attachment.htm>
