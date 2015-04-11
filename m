From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 11 Apr 2015 09:59:43 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix uClibc build whitout MMU
In-Reply-To: <20150411094313.70d4ada5@free-electrons.com>
References: <1428700329-670-1-git-send-email-romain.naour@openwide.fr>
 <20150411094313.70d4ada5@free-electrons.com>
Message-ID: <5528D46F.70004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 11/04/2015 09:43, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Fri, 10 Apr 2015 23:12:09 +0200, Romain Naour wrote:
> 
>> diff --git a/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
>> new file mode 100644
>> index 0000000..42168df
>> --- /dev/null
>> +++ b/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
>> @@ -0,0 +1,34 @@
>> +From 59432cbfe267ad89b7cfc73dcd702b8282ef4e9d Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@openwide.fr>
>> +Date: Fri, 10 Apr 2015 22:58:07 +0200
>> +Subject: [PATCH] gdbserver: fix uClibc whithout MMU.
> 
> Is this an upstream gdb patch?

Not yet, I'm waiting for reply on gdb-patches mailing list:
https://sourceware.org/ml/gdb-patches/2015-04/msg00415.html
https://sourceware.org/ml/gdb-patches/2015-04/msg00416.html

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
