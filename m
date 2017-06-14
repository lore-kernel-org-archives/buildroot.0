From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Jun 2017 13:27:24 +0200
Subject: [Buildroot] [PATCH] gcc: add option to build and install gcc's
 libssp
In-Reply-To: <AM3PR05MB433F8CD5087964A86E0CECCC9C30@AM3PR05MB433.eurprd05.prod.outlook.com>
References: <AM3PR05MB433F8CD5087964A86E0CECCC9C30@AM3PR05MB433.eurprd05.prod.outlook.com>
Message-ID: <8e502eb9-e14f-ae20-ec6a-4cc8c2b052c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-06-17 09:48, Guy Benyei wrote:
> Hello,
> 
>> When double checking the result of compiling uClibc with
>> BR2_TOOLCHAIN_BUILDROOT_USE_SSP, I've seen, that uClibc is actually binary-
>> identical to the version built without BR2_TOOLCHAIN_BUILDROOT_USE_SSP. I
>> find it strange, as actually there should be some additional functions and
>> variables enabled in this case. Anyhow,  might be able to work with the uClibc
>> support enabled by default.
> 
> Triple checking shows 8K addition to the uClibc shared object - which is around 3% of its original size. Still not too much for us, so I'll stick with the uClibc SSP support.

 So you withdraw this patch?

 If so, please mark it as Rejected in patchwork [1]. If you create an account
with the same e-mail address with which you submitted the original patch, you
can modify its state.

 Or if you can't be bothered creating a patchwork account, I can do it as well.
I just want to be sure you indeed intend to withdraw the patch.

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/774461/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
