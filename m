From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 19 Jun 2008 15:25:47 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <20080619120326.GD6874@mx.loc>
References: <485A3396.80701@cetrtapot.si> <485A3ABF.90707@cetrtapot.si>
	<20080619111343.GC6874@mx.loc> <485A48EC.7040704@cetrtapot.si>
	<20080619120326.GD6874@mx.loc>
Message-ID: <485A5E5B.1020907@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Jun 19, 2008 at 01:54:20PM +0200, Hinko Kocevar wrote:
> 
>>  LD libuClibc-0.9.29.so
>> libc/libc_so.a(libc_pthread_init.oS): In function `testandset':
>> libc_pthread_init.c:(.text+0x0): multiple definition of `testandset'
>> libc/libc_so.a(forward.oS):forward.c:(.text+0x0): first defined here
>> make[2]: *** [lib/libc.so] Error 1
>> make[1]: *** [lib/libc.so.0] Error 2
>> make[1]: Leaving directory `/work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29'
>> make: *** [/work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29/lib/libc.a] Error 2
> 
> Sounds familiar. I'll take care of it in the evening.
> 

This patch takes care of the uClibc compilation problem for me.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.29-cris-pthreads.patch
Type: text/x-patch
Size: 593 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080619/70794756/attachment-0001.bin 
