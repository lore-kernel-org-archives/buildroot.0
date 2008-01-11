From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 11 Jan 2008 12:03:08 +0000
Subject: [Buildroot] tslib build error
In-Reply-To: <47876A69.70804@promwad.com>
References: <47875526.5090103@carallon.com> <47876A69.70804@promwad.com>
Message-ID: <47875AFC.3090403@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks that fixed it, not sure how I missed that one.

Ivan Kuten wrote:
> Will Wagner wrote:
>> Hi All,
>>
>> I'm having a build error when trying to build tslib. Attached is the 
>> error. The thing that is confusing me is that I have managed to make it 
>> build on one of the machines we have here but I now need to get it 
>> building on a second and there I get this error. They are both debian 
>> lenny boxes with similar but not identical packages installed.
>>
>> Can anyone tell me if I am missing a package or I need some environment 
>> variable?
>>
>> Any help tracking this down is much appreciated.
>>
>> Will.
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
> 
> Hi,
> 
> Think you have to install libtool package.
> 
> Regards,
> Ivan

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
