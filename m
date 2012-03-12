From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 11 Mar 2012 21:20:30 -0500
Subject: [Buildroot]  Toolchain for Microblaze
In-Reply-To: <CAEBucnBDBsHffFp=FZ5rkzN-ubrNLr_2U=_dQAtKe6AuuQg_tQ@mail.gmail.com>
References: <4F5CEE5D.30504@relinux.de>
 <CAEBucnBDBsHffFp=FZ5rkzN-ubrNLr_2U=_dQAtKe6AuuQg_tQ@mail.gmail.com>
Message-ID: <CAEBucnBH6PPeuAh3ZsFm3cQ_fiSY40eFeSbxFZC0UHi6Tjg54g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 11, 2012 at 1:26 PM, Stephan Hoffmann <sho@relinux.de> wrote:
> Hello all,
>
> I just found on the gcc web site ( http://gcc.gnu.org/gcc-4.6/changes.html )
> the following message:
>
> MicroBlaze
>
> Support has been added for the Xilinx MicroBlaze softcore processor
> (microblaze-elf) embedded target. This configurable processor is supported
> on several Xilinx Spartan and Virtex FPGAs.
>
> This sounds like good news. Maybe we can get rid of the prebuild Xilinx
> Toolchain.
>
> Unfortunatelly, I don't have any experience in building toolchains. A first
> try building it as internal toolchain with almost standard settings ended
> with an aclocal error;-(
>
> Can anyone try building it?
>
> Kind regards
>
> Stephan
>
> --
> reLinux ? ? - ? ?Stephan Hoffmann
> Am Schmidtgrund 124 ? ?50765 K?ln
> Tel. +49.221.95595-19 ? ?Fax: -64
> www.reLinux.de ? ? sho at reLinux.de
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


I agree it would be nice. Although, I have tried to get this to work
with no success.  The following repos may be of some help (have not
had time to test them.)

http://git.monstr.eu/git/

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
