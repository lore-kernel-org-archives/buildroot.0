From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 12 Mar 2012 18:17:47 +0100
Subject: [Buildroot] Toolchain for Microblaze
In-Reply-To: <CAEBucnBDBsHffFp=FZ5rkzN-ubrNLr_2U=_dQAtKe6AuuQg_tQ@mail.gmail.com>
References: <4F5CEE5D.30504@relinux.de>
 <CAEBucnBDBsHffFp=FZ5rkzN-ubrNLr_2U=_dQAtKe6AuuQg_tQ@mail.gmail.com>
Message-ID: <4F5E2FBB.3080407@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.03.2012 02:37, schrieb Spenser Gilliland:
> I agree it would be nice. Although, I have tried to get this to work
> with no success.  The following repos may be of some help (have not
> had time to test them.)
>
> http://git.monstr.eu/git/
>
> Spenser
I just thought about trying this old 4.1.2 version when I found out that
gnu now supports Microblaze in 4.6. I hope someone familiar in building
toolchains can help building it.

Stephan
> On Sun, Mar 11, 2012 at 1:26 PM, Stephan Hoffmann <sho@relinux.de> wrote:
>> Hello all,
>>
>> I just found on the gcc web site ( http://gcc.gnu.org/gcc-4.6/changes.html )
>> the following message:
>>
>> MicroBlaze
>>
>> Support has been added for the Xilinx MicroBlaze softcore processor
>> (microblaze-elf) embedded target. This configurable processor is supported
>> on several Xilinx Spartan and Virtex FPGAs.
>>
>> This sounds like good news. Maybe we can get rid of the prebuild Xilinx
>> Toolchain.
>>
>> Unfortunatelly, I don't have any experience in building toolchains. A first
>> try building it as internal toolchain with almost standard settings ended
>> with an aclocal error;-(
>>
>> Can anyone try building it?
>>
>> Kind regards
>>
>> Stephan
>>
>> --
>> reLinux     -    Stephan Hoffmann
>> Am Schmidtgrund 124    50765 K?ln
>> Tel. +49.221.95595-19    Fax: -64
>> www.reLinux.de     sho at reLinux.de
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
