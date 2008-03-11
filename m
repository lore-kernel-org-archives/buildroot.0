From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 11 Mar 2008 20:39:09 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
In-Reply-To: <1204829421.9461.81.camel@localhost>
References: <20080306182758.09F16120295@busybox.net>
	<1204829421.9461.81.camel@localhost>
Message-ID: <47D6EDED.5090506@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> Log:
>> patches for tslib
>>
>> Added:
>>    trunk/buildroot/package/tslib/tslib-1.0-absbit.patch
>>    trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch
> 
> These two patches are actually wrong, I think the tslib error you (I)
> see is because of big-endian architecture. I will hopefully give it a go
> next week. As long as I remember it (-:

tslib-1.0-remove-return-on-error-from-check-df.patch is definitely wrong 
- with this patch applied I get lots of error messages and inspecting 
the code the patch removes code that is needed.

Not sure about the tslib-1.0-absbit.patch patch. I think it is correct 
as you only need 16 bits as ABS_MAX is 0x3f

Regards,

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
