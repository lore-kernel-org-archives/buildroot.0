From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 08 Feb 2008 12:45:21 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
In-Reply-To: <200802081007.30537.atle@nissestad.no>
References: <20080207105901.5A0FB12C65B@busybox.net>
	<200802081007.30537.atle@nissestad.no>
Message-ID: <47AC32C1.8070706@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for hint, I indeed forgot to svn add.

Regards,
Ivan

Atle Nissestad wrote:
> On Thursday 7. February 2008 11:59:01 vanokuten at uclibc.org wrote:
>> Author: vanokuten
>> Date: 2008-02-07 02:59:00 -0800 (Thu, 07 Feb 2008)
>> New Revision: 20953
>>
>> Log:
>> updated gdb support for nios2, thanks Atle
>>
>> Modified:
>>    trunk/buildroot/toolchain/gdb/Config.in
>>
>>
>> Changeset:
>> Modified: trunk/buildroot/toolchain/gdb/Config.in
> 
> Seems you missed the important part of my patch, the actual nios2 gdb 6.6 
> arch-support (/buildroot/toolchain/gdb/6.6/700-nios2-6.6.patch).
> Forgot to 'svn add' perhaps ..?
> 
> - Atle
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
