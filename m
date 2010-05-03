From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 3 May 2010 17:25:30 +0200
Subject: [Buildroot] buildroot 2010.05-rc1 fail to build gst-plugins-ugly
In-Reply-To: <4BDEE442.4060006@digi.com>
References: <4BDEE442.4060006@digi.com>
Message-ID: <x2v4d28d4b51005030825o21717459p64184c1d83be2641@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 3, 2010 at 4:57 PM, Javier Viguera <javier.viguera@digi.com> wrote:
> Hi all,
>
> Same problem again with 2010.05-rc1.
>
> Seems that the patch applied by Peter is not exactly the same than Lionel's
> because Lionel's was working and current RC1 is not:
>
> Now is trying to link to a host libmad.
>
> libtool: link:
> /usr/local/DigiEL-5.5/x-tools/arm-unknown-linux-gnueabi/bin/arm-linux-gcc
> -O3 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp -O3
> -mabi=aapcs-linux -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 --sysroot /data/repo/buildroot.git/output/staging/
> -shared .libs/libgstmad_la-gstmad.o .libs/libgstmad_la-gstid3tag.o
> -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lxml2
> -lglib-2.0 -lintl -lgsttag-0.10 -lgstaudio-0.10 /usr/lib/libmad.so
> /usr/lib/libid3tag.so -lz ?-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp
> -mabi=aapcs-linux -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp
> -mabi=aapcs-linux -pthread ? -pthread -Wl,-soname -Wl,libgstmad.so
> -Wl,-version-script -Wl,.libs/libgstmad.ver -o .libs/libgstmad.so
>
> /usr/lib/libmad.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
>
> Again attached buildroot's config file.
>
> --
> Regards,
>
> Javier Viguera
> Software Engineer
>
> Digi International Spain, S.A.
> http://www.digi.com
>

Could you give us the config.log file from output/build/gst-plugins-ugly-x.y.z/

Regards,

--
Lionel
