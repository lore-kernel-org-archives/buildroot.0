From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Dec 2012 15:12:27 -0300
Subject: [Buildroot] [PATCH] gettext: bump to version 0.18.1.1
In-Reply-To: <A30A1B4688B14FF0A9174D8D473754CD@JohanW7>
References: <1355428977-8297-1-git-send-email-gustavo@zacarias.com.ar>
 <871ueskiar.fsf@dell.be.48ers.dk> <A30A1B4688B14FF0A9174D8D473754CD@JohanW7>
Message-ID: <50CB6C0B.7090606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/14/2012 03:08 PM, Sagaert Johan wrote:

> Hi
> 
> After pulling the latest commits : 
> 
> libtool: compile:  /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -c
> -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL
> -DIN_LIBINTL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
> -Dset_relocation_prefix=libintl_set_relocation_prefix -Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I.
> -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -pipe -Os -fvisibility=hidden ./printf.c -o printf.o >/dev/null 2>&1
> ./localename.c: In function '_nl_locale_name_thread_unsafe':
> ./localename.c:2619:31: error: dereferencing pointer to incomplete type
> make[4]: *** [localename.lo] Error 1
> make[4]: *** Waiting for unfinished jobs....
> 
> Using uClibc 0.9.33.1 (NTPL)
> 
> Regards , Johan

.config please
And 0.9.33.1? That's not current.
Regards.
