From: Hao HU <huhao526200@gmail.com>
Date: Mon, 30 Jul 2018 04:04:04 -0500 (CDT)
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <CAMWSM7i=dS5gbqwDRM34KPsu_9ArgYj3cwHYdp3tQ+pE5=L2Rg@mail.gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <1532611912386-0.post@n4.nabble.com>
 <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
 <1532700227020-0.post@n4.nabble.com>
 <CAMWSM7i=dS5gbqwDRM34KPsu_9ArgYj3cwHYdp3tQ+pE5=L2Rg@mail.gmail.com>
Message-ID: <1532941444387-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph Kogut wrote
> On Fri, Jul 27, 2018 at 7:03 AM Hao HU &lt;

> huhao526200@

> &gt; wrote:
>>
>> Hi Joseph,
>>
>> Today I tried to set use_gold=false in CHROMIUM_OPTS in chromium.mk.
>>
>> But it did't work. The same problem as following still exists.
>>
>> //home/as_huhao/eolane/x2m/buildroot-2018.05-IHMI/output/host/bin/ld.lld:
>> error: can't create dynamic relocation R_386_32 against local symbol in
>> readonly segment; recompile object files with -fPIC
>> >>> defined in
>> obj/third_party/ffmpeg/libffmpeg_yasm.a(ffmpeg_yasm/dct32.o)
>> >>> referenced by ../../third_party/ffmpeg/libavcodec/x86/dct32.asm
>> >>>               ffmpeg_yasm/dct32.o:(ff_dct32_float_sse) in archive
>> >>> obj/third_party/ffmpeg/libffmpeg_yasm.a /
>>
> 
>>Did you allow the Chromium package to reconfigure, i.e., by deleting
>>.stamp_configured, or running 'make chromium-dirclean all'?
> 
> Before I tested if the use_gold=false worked or not, firstly I deleted the
> folder 
/
> /ouput/build/chromium--67.0.3396.79 
/
> then I run $ make 
> 
> Is that right or not?
> _______________________________________________
> buildroot mailing list

> buildroot@

> http://lists.busybox.net/mailman/listinfo/buildroot





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
