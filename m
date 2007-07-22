From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 00:51:40 +0200
Subject: [Buildroot]
	svncommit:trunk/buildroot/target/device/Atmel/Linux:kernel-patches-2.6.22.1
References: <20070720082750.D5D413008C@busybox.net>
	<46A3D08D.4070505@tait.co.nz>
Message-ID: <013801c7ccb3$1b627c80$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ulf at uclibc.org wrote:
>> Author: ulf
>> Date: 2007-07-20 01:27:49 -0700 (Fri, 20 Jul 2007)
>> New Revision: 19172
>> 
>> Log:
>> Add patch for linux 2.6.22.1
>> 
>> Added:
>>    trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.22.1/
>>    trunk/buildroot/target/device/Atmel/Linux/kernel-patches-2.6.22.1/2.6.22.1-atmel.patch
>> 
>> 
>> Changeset:
>> 
>> Sorry, the patch is too large to include (9725 lines).
>> Please use ViewCVS to see it!
>> 
>> http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19172
> 
> Is there any differentiation between different families of Atmel CPU in 
> the buildroot tree? i.e. does this patchset only apply to AT91 series or 
> does it include AVR32?
> 

So far, only AT91 but I am preparing support for AVR32 as well.
Please note that a lot of the AVR32 patches are already included in linux-2.6.22.1


Best Regards
Ulf Samuelsson
