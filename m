From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 14 Dec 2012 19:08:37 +0100
Subject: [Buildroot] [PATCH] gettext: bump to version 0.18.1.1
In-Reply-To: <871ueskiar.fsf@dell.be.48ers.dk>
References: <1355428977-8297-1-git-send-email-gustavo@zacarias.com.ar>
 <871ueskiar.fsf@dell.be.48ers.dk>
Message-ID: <A30A1B4688B14FF0A9174D8D473754CD@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

After pulling the latest commits : 

libtool: compile:  /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -c
-DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DLIBDIR=\"/usr/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL
-DIN_LIBINTL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libintl_set_relocation_prefix -Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I.
-I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os -fvisibility=hidden ./printf.c -o printf.o >/dev/null 2>&1
./localename.c: In function '_nl_locale_name_thread_unsafe':
./localename.c:2619:31: error: dereferencing pointer to incomplete type
make[4]: *** [localename.lo] Error 1
make[4]: *** Waiting for unfinished jobs....

Using uClibc 0.9.33.1 (NTPL)

Regards , Johan
 

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: vrijdag 14 december 2012 12:03
Aan: Gustavo Zacarias
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH] gettext: bump to version 0.18.1.1

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
