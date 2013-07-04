From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 04 Jul 2013 10:16:39 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <87ehbfrc4e.fsf@dell.be.48ers.dk>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
 <51D155A0.3010205@gmail.com> <51D26E29.6030805@mind.be>
 <20130702093415.5db13282@skate>
 <20130702071112.d2bed52344e1786c14494b36@lavabit.com>
 <87d2r0sknt.fsf@dell.be.48ers.dk>
 <CA+-urNQB5-1ZjvzV2mVdtFq2cnbb3R5r-LWLuVj0Si=LtKjOUQ@mail.gmail.com>
 <87ehbfrc4e.fsf@dell.be.48ers.dk>
Message-ID: <51D52F67.8050508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/2013 03:45 PM, Peter Korsgaard wrote:
>>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
>  >> I think the best way forward in the short term would be if somebody
>  >> would maintain a git tree containing the kernel sources and Koen's patch
>  >> set applied on top, and once in a while sync / send a patch to buildroot
>  >> to update the git revision the bbb config uses.
>  >> 
>
>  Frank> FWIW, Robert Nelson (Ubuntu and Debian maintainer for Beaglebone)
>  Frank> regularly posts a summarized version of Koen's patch set. Here's what
>  Frank> I'm currently using for the BBB:
>
>  Frank> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  Frank> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.13"
>  Frank> BR2_LINUX_KERNEL_PATCH="http://rcn-ee.net/deb/sid-armhf/v3.8.13-bone22/patch-3.8.13-bone22.diff.gz"
>
>  Frank> It seems to work, but I haven't tested all that much yet.
>
> Ok, great - That will also work.
>
Hello,

I'm also going to check this overall patch ( i don't know how i didn't
find it earlier, thanks for the hint), and let the community know about
my results.


-- 
br, 
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
