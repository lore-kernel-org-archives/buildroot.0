From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri, 11 Sep 2020 22:42:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 20.08.00
In-Reply-To: <20200907213246.771557-1-fontaine.fabrice@gmail.com>
References: <20200907213246.771557-1-fontaine.fabrice@gmail.com>
Message-ID: <CAK4VdL0rO3wiptyc+i7bHT9ETJ2j8hDQ7x3xWz7gC=mh_d=XKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 7, 2020 at 11:32 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Update patch
> - Update hash of license file (update in year, git.mk added, lintian
>   warning fixed):
>   - https://github.com/ColinIanKing/fwts/commit/2a75afca6f392491bbe8541398d409c459718388
>   - https://github.com/ColinIanKing/fwts/commit/429c2595847c673515967622787722a0341994bd
>   - https://github.com/ColinIanKing/fwts/commit/bc71a14a4a65a07585a8600c46c85a3a32b92e69
> - json-c has been dropped since version 20.08.00 and
>   https://github.com/ColinIanKing/fwts/commit/1a663dd3b37948b84452f5ab20f2ba8a86e3911f
> - Update indentation in hash file (two spaces)
>
> This bump will also fix the following build failure with bison 3.7.1
> thanks to
> https://github.com/ColinIanKing/fwts/commit/cfd5f5870751a796462cdd2f7e41f5f0dabb67b8:
>
> libtool: compile:  /home/peko/autobuild/instance-1/output-1/host/bin/aarch64-linux-gcc -DHAVE_CONFIG_H -I. -I../.. -Wall -Wstrict-prototypes -fno-strict-aliasing -D_LINUX -DACPI_ASL_COMPILER -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -I../acpica/source/include -I../acpica/source/compiler -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c aslcompiler.c  -fPIC -DPIC -o .libs/libfwtsiasl_la-aslcompiler.o
> aslcompiler.tab.c:297:10: fatal error: aslcompiler.tab.h: No such file or directory
>
> Fixes:
>  - http://autobuild.buildroot.org/results/3eeb20a24595ab1b790bd770ba745676225ef8b9
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---

Looks good to me, thanks for bumping it.

Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
