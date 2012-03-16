From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 16 Mar 2012 10:15:44 -0700
Subject: [Buildroot] Create a bootable SD Card
In-Reply-To: <63D6870D443E63419AC4A0C97B86C0920428BC3017@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C0920428BC3017@MBXCLUSTER.mdh.local>
Message-ID: <CALo-6+gbspKsGHYmo8521xzL=h3ivyovELQfanr+tMfaNgJbrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mikael:

I have looked at the i.mx28 EVK with another engineer here and as I
recall, you need to study how LTIB creates its bootable SD card and
use the files created by buildroot to do the same thing.

I am not sure it is fair to say that buildroot should create a
bootable SD card, but it is fair to say that the kernel and root file
systems created by either buildroot or LTIB should work just fine on
an i.MX28 EVK.

Said differently, the LTIB instructions and the .PDF file that comes
with the i.MX28 describes how to create the two partitions on the
bootable SD card, which if I recall, one of them is a FAT partition.

Charles

On Fri, Mar 16, 2012 at 9:19 AM, Mikael ?sberg <mikael.asberg@mdh.se> wrote:
> Hello,
>
> I have generated a file-system, bootloader and image for the platform i.MX28 EVK (using Buildroot).
>
> How do I create a bootable SD memory card (using these files)?
>
> Regards
>
> --------------------------------------------------------------
> Mikael ?sberg
> PhD student (Doktorand), Computer Engineering
> School of Innovation, Design and Engineering
> M?lardalen University, V?ster?s Sweden
> Phone: +46(0)21 101502
> Room nr: U1-145
> Mail: mikael.asberg at mdh.se
> --------------------------------------------------------------
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Charles Krinke
