From: =?iso-8859-1?Q?=22=D6mer_Celikkanat=22?= <CelikkanatOemer@gmx.de>
Date: Tue, 16 Oct 2007 09:40:16 +0200
Subject: [Buildroot] build pango-1.13.5 fails
Message-ID: <20071016074016.163350@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I'm new in this mailing list. And I have some problems to build any packages. I get kind of errors from "pango". Here some of them:

querymodules.o: In function `string_needs_escape':
querymodules.c:(.text+0x37): undefined reference to `g_ascii_table'
querymodules.o: In function `escape_string':
querymodules.c:(.text+0x65): undefined reference to `g_string_new'
querymodules.c:(.text+0xaf): undefined reference to `g_string_append'
querymodules.c:(.text+0xc4): undefined reference to `g_string_append'
querymodules.c:(.text+0xd9): undefined reference to `g_string_append'
querymodules.c:(.text+0x103): undefined reference to `g_string_free'
querymodules.o: In function `g_string_append_c_inline':
querymodules.c:(.text+0x169): undefined reference to `g_string_insert_c'
.....

or

../pango-1.13.5/pango/.libs/libpango-1.0.so: undefined reference to `g_slist_free_1'
../pango-1.13.5/pango/.libs/libpango-1.0.so: undefined reference to `g_key_file_load_from_file'
../pango-1.13.5/pango/.libs/libpangoft2-1.0.so: undefined reference to `g_array_sort'
../pango-1.13.5/pango/.libs/libpangoft2-1.0.so: undefined reference to `g_memdup'
../pango-1.13.5/pango/.libs/libpango-1.0.so: undefined reference to `g_type_module_unuse'
../pango-1.13.5/pango/.libs/libpango-1.0.so: undefined reference to `g_slist_concat'
.....
collect2: ld returned 1 exit status
make[4]: *** [pango-querymodules] Error 1
make[4]: Leaving directory `../pango-1.13.5/pango'


I thought that is a link problem to the libraries from glib2, but i had unfortunately no success. Can somebody help me ?? Have somebody a solution for me? It would be very nice. Thank you...


?mer
-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal f?r Modem und ISDN: http://www.gmx.net/de/go/smartsurfer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: CelikkanatOemer.vcf
Type: text/x-vcard
Size: 275 bytes
Desc: vcard
Url : http://busybox.net/lists/buildroot/attachments/20071016/f5672df6/attachment.vcf 
