From: Hao HU <huhao526200@gmail.com>
Date: Fri, 27 Jul 2018 09:03:47 -0500 (CDT)
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <1532611912386-0.post@n4.nabble.com>
 <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
Message-ID: <1532700227020-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

Today I tried to set use_gold=false in CHROMIUM_OPTS in chromium.mk.

But it did't work. The same problem as following still exists. 

//home/as_huhao/eolane/x2m/buildroot-2018.05-IHMI/output/host/bin/ld.lld:
error: can't create dynamic relocation R_386_32 against local symbol in
readonly segment; recompile object files with -fPIC
>>> defined in obj/third_party/ffmpeg/libffmpeg_yasm.a(ffmpeg_yasm/dct32.o)
>>> referenced by ../../third_party/ffmpeg/libavcodec/x86/dct32.asm
>>>               ffmpeg_yasm/dct32.o:(ff_dct32_float_sse) in archive
>>> obj/third_party/ffmpeg/libffmpeg_yasm.a /

Best regards,

Hao




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
