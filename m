From: Piyush Verma <piyush.pv@gmail.com>
Date: Tue, 22 Jun 2010 11:17:43 +0800
Subject: [Buildroot] TinyX Failed to build (PANGO)
In-Reply-To: <4C1EEE43.2000406@ethertek.ca>
References: <AANLkTikBmMVIw2iXKqeyEmt0u1WTsRz9EB4rV-GMTtIY@mail.gmail.com>
	<AANLkTikfmCmyrmCVINrjP2ksxz9f-tt0FIlDU_h_yB_U@mail.gmail.com>
	<4C1EEE43.2000406@ethertek.ca>
Message-ID: <AANLkTimhjmbrX_YqlAvSoTtxJgyRnCSy1GJ7ZmdUS3q1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Dan for suggestion

I check that but it's already enabled.

DO_C99_MATH=y

Any other suggestion ?

Thanks & Regards

Piyush Verma
On Mon, Jun 21, 2010 at 12:44 PM, Dan Pattison <dan.pattison@ethertek.ca>wrote:

> Hello,
>
> I had this same problem awhile ago. I think turning on the C99 math library
> in uClibc fixed it.
>
> Regards,
>
> Dan Pattison
> Ethertek Circuits
>
>
>
> Piyush Verma wrote:
>
>> Hello All
>>
>>
>> I was building TinyX for ARM176jzf-s wtih v2010.05 stable release.
>>
>> I have used All default setting just selected Target-Architecture  Tiny-X
>> and libgtk2.
>>
>> It failed to build with Error Below.
>>
>> /mv/dev/buildroot/buildroot-
>> 2010.05/output/staging/usr/lib/libglib-2.0.so <http://libglib-2.0.so/>:
>> warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
>>
>> /mv/dev/buildroot/buildroot-2010.05/output/staging/usr/lib/libX11.so:
>> warning: gethostbyname is obsolescent, use getnameinfo() instead.
>> /mv/dev/buildroot/buildroot-2010.05/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
>> pango-querymodules: hidden symbol `__gnu_uldivmod_helper' in
>> /mv/dev/buildroot/buildroot-2010.05/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/libgcc.a(bpabi.o)
>> is referenced by DSO
>> /mv/dev/buildroot/buildroot-2010.05/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
>> final link failed: Nonrepresentable section on output
>> collect2: ld returned 1 exit status
>> make[5]: *** [pango-querymodules] Error 1
>> make[5]: Leaving directory
>> `/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/pango'
>> make[4]: *** [all-recursive] Error 1
>> make[4]: Leaving directory
>> `/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/pango'
>> make[3]: *** [all] Error 2
>> make[3]: Leaving directory
>> `/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/pango'
>> make[2]: *** [all-recursive] Error 1
>> make[2]: Leaving directory
>> `/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5'
>> make[1]: *** [all] Error 2
>> make[1]: Leaving directory
>> `/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5'
>> make: ***
>> [/mv/dev/buildroot/buildroot-2010.05/output/build/pango-1.20.5/.stamp_built]
>> Error 2
>>
>>
>> Any suggestion how to solve this problem
>>
>>
>> --
>> Thanks & Regards
>>
>> Piyush Verma
>> ------------------------------------------------------------------------
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>> ------------------------------------------------------------------------
>>
>>
>> No virus found in this incoming message.
>> Checked by AVG - www.avg.com Version: 9.0.819 / Virus Database:
>> 271.1.1/2952 - Release Date: 06/20/10 11:36:00
>>
>>
>>
>


-- 
Thanks & Regards

Piyush Verma
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100622/c0496f36/attachment.html>
