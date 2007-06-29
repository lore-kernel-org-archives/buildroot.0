From: softa at ttechgroup.com <softa@ttechgroup.com>
Date: Fri, 29 Jun 2007 11:32:00 +0300
Subject: [Buildroot] x86_64 , cannot find /lib/libc.so.0
References: <1497cb6d0706290020n269e359av8682c69fb22b3e79@mail.gmail.com>
	<20070629082320.GE8033@aon.at>
Message-ID: <005501c7ba27$f69e7860$6614a8c0@softalap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i have the same problem, if someone gives to me short instructions what/how 
to do, i will try to make it.

Assen

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Lee JJ" <jengjr@gmail.com>
Cc: <buildroot@uclibc.org>
Sent: Friday, June 29, 2007 11:23 AM
Subject: Re: [Buildroot] x86_64 , cannot find /lib/libc.so.0


> On Fri, Jun 29, 2007 at 03:20:35PM +0800, Lee JJ wrote:
>>/root/buildroot/build_x86_64/staging_dir/usr/x86_64-linux-uclibc/bin/ld:
>>skipping incompatible /root/buildroot/build_x86_64/s
>>taging_dir/lib/libc.so.0 when searching for /lib/libc.so.0
>>/root/buildroot/build_x86_64/staging_dir/usr/x86_64-linux-uclibc/bin/ld:
>>cannot
>>find /lib/libc.so.0 inside /root/buildroot/bu
>>ild_x86_64/staging_dir
>>collect2: ld returned 1 exit status
>>make[4]: *** [32/libgcc_s.so] Error 1
>>
>># ls build_x86_64/staging_dir/lib/libc.so.0 -lt
>>lrwxrwxrwx 1 root root 19 Jun 28 15:11
>>build_x86_64/staging_dir/lib/libc.so.0 -> libuClibc-0.9.29.so
>>
>>But the file do exist !??
> 'skipping incompatible' != 'ENOENT'
>
> Patches to fix multilib support are welcome.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
