From: lists at primefarm.co.uk <lists@primefarm.co.uk>
Date: Wed, 22 Nov 2006 20:09:05 -0000 (UTC)
Subject: [Buildroot] problem generating c++ compiler for target arch
In-Reply-To: <20061122200213.GB1863@aon.at>
References: <33335.80.176.236.13.1164224678.squirrel@mail.primefarm.co.uk>
	<20061122200213.GB1863@aon.at>
Message-ID: <33446.80.176.236.13.1164226145.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, November 22, 2006 8:02 pm, Bernhard Fischer wrote:
> On Wed, Nov 22, 2006 at 07:44:38PM -0000, lists at primefarm.co.uk wrote:
>
>> On Wed, November 22, 2006 6:52 pm, Bernhard Fischer wrote:
>>
>
>> OK, I tried again with 3.4.6, those errors do indeed go away. I now
>> have a differnt set of problems (hooray!).
>>
>> The error seems to center around fakeroot, although I'm no expert at
>> reading these error dumps.
>>
>> Here is the whole lot:
>>
>>
>> CONFIG_FILES= CONFIG_HEADERS= /bin/sh ./config.status
>> config.status: executing depfiles commands
>> config.status: executing libtool commands
>> /bin/sh ./libtool --tag=CC --mode=link gcc  -g -O2   -o faked  faked.o
>> libcommunicate.la -ldl libtool: link: gcc -g -O2 -o faked faked.o
>> ./.libs/libcommunicate.a -ldl
>> /usr/lib/libc_nonshared.a(elf-init.oS)(.gnu.linkonce.t.__i686.get_pc_thu
>> nk.bx+0x0):
>> In function `__i686.get_pc_thunk.bx':
>> : multiple definition of `__i686.get_pc_thunk.bx'
>>
>
>>
>> Any ideas?
>>
>
> Not sure, but it sounds like your host's toolchain is too old.
> binutils-2.16.1 work for me..
>


I'm running it on 2.16.1 already. The box im running it on is debian sarge
- which could explain some random things being far too old.

What newer versions of binutils do you reccomend?
