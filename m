From: Joe <zentrale.at.work@gmail.com>
Date: Mon, 21 Jan 2008 17:56:49 +0100
Subject: [Buildroot] buildroot toolchain fails to build kernel: "ld: no
 machine record defined"
In-Reply-To: <20080121164720.GA22900@aon.at>
References: <4794C65B.4010105@gmail.com> <20080121164720.GA22900@aon.at>
Message-ID: <4794CED1.5040906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer schrieb:
> On Mon, Jan 21, 2008 at 05:20:43PM +0100, Joe wrote:
>> Hi all!
>>
>> Today I tried to build a new kernel for my dev-board. Last time i did 
>> this was Nov 2007, when i also used a buildroot-created toolchain which 
>> worked absolutely fine. Today it compiles a lot, and then backs out with
>>
>> "arm-linux-ld: no machine record defined" in the file .tmp_vmlinux1
>>
>> After googling a lot, i found some messages including one by Russell 
>> King indicating that there is probably something wrong with the used 
>> binutils and that it should be reported to the binutils people. But 
>> because i used the buildroot chain, i thought i'd ask here first.
>> Tried combinations include gcc 4.2.1 and 4.1.2 as well as binutils 2.18 
>> and 2.17 on kernels 2.6.22.10 and 2.6.23.14. Every possible combination 
>> was given a try with the same results.
>>
>> Are there any ideas on this?
> 
> Please send me your buildroot.config and (if it's not the default) your
> uClibc.config and kernel.config for me to reproduce.
> 

Thanks for the quick reply, Bernhard.

Please find the buildroot and kernel configs attached, uclibc config is 
standard with buildroot latest revision for svn.

Greetz Joe

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at gmail.com

watch out for:
www.rocksociety.de
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
Url: http://busybox.net/lists/buildroot/attachments/20080121/f4268c8f/attachment-0002.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: kernel.config
Url: http://busybox.net/lists/buildroot/attachments/20080121/f4268c8f/attachment-0003.diff 
