From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 14:39:30 +0100
Subject: [Buildroot] Results of an all-package build
In-Reply-To: <50CEDCB3.2070705@mind.be>
References: <50C9901D.2020704@mind.be> <871ueqhna8.fsf@dell.be.48ers.dk>
 <50CEDCB3.2070705@mind.be>
Message-ID: <50CF2092.3040109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 09:49, Arnout Vandecappelle wrote:
> On 16/12/12 01:07, Peter Korsgaard wrote:
>>>>>>> >>>>>>  "Arnout" == Arnout Vandecappelle<arnout@mind.be>   writes:
>> >
>> >  Hi,
>> >
>> >     Arnout>    As part of the test of the disable-doc patch I just sent, I
>> >     Arnout>   built something approaching an allyespackageconfig for x86_64
>> >     Arnout>   with a Sourcery-2012.09 toolchain.  Interesting to look at the
>> >     Arnout>   results.
>> >
>> >     Arnout>   - The following fail to build:
>> >
>> >     Arnout>    * classpath
>> >     Arnout>    * diffutils
>> >     Arnout>    * gpsd
>> >     Arnout>    * ipsec-tools
>> >     Arnout>    * linux-pam
>> >     Arnout>    * ltp-testsuite
>> >     Arnout>    * matchbox-desktop
>> >     Arnout>    * metacity
>> >     Arnout>    * webkit

  Webkit is fixed now.

>> >     Arnout>    * neard
>> >     Arnout>    * netatalk

  Not fixed by lib64 patch...

>> >     Arnout>    * network-manager
>> >     Arnout>    * pcmanfm
>> >     Arnout>    * pv
>> >     Arnout>    * sconeserver-http-sconesite-image

  Not fixed by using pkg-config...

>> >     Arnout>    * xdriver_xf86-video-geode
>> >     Arnout>    * xdriver_xf86-input-synaptics
>> >     Arnout>    * valgrind (because glibc 2.16 is not supported, needs valgrind bump)
>> >     Arnout>    * xstroke
>> >     Arnout>    * grub
>> >     Arnout>    * uboot (wrong ARCH parameter)

>   I'll try to re-run current HEAD (which has fixed quite a few packages
> already) with make -k and put it on a pastebin.

  The results of a make -k of just these packages (except for grub and 
uboot) is on http://tny.cz/8f1cf19f .

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
