From: William Wagner <will_wagner@carallon.com>
Date: Mon, 15 Feb 2010 18:32:12 +0000
Subject: [Buildroot] Using an external Linux tree
In-Reply-To: <hlc14m$tmh$1@ger.gmane.org>
References: <4B792E68.6020907@heig-vd.ch> <hlc14m$tmh$1@ger.gmane.org>
Message-ID: <4B79932C.2030604@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/02/2010 17:43, Grant Edwards wrote:
> On 2010-02-15, Marc Garnier<marc.garnier@heig-vd.ch>  wrote:
>
>    
>> *Cliff Holden* Cliff.Holden at Atheros.com:
>>      
>>> I'm somewhat new to buildroot, but have been building kernels
>>> for a while.  I have a general question:
>>>
>>> What is the proper procedure for using an external linux
>>> kernel tree in the build?  Our SCC system (source code
>>> control) is set up to have various kernel versions located in
>>> a particular location.  If I could get buildroot to "point" to
>>> this external kernel, it would be helpful.
>>>
>>> I did try the "advanced" options that allows the specification
>>> of a kernel version and an external "patch" file, which is
>>> close, but the custom kernel I have is not set up as a set of
>>> patches.  I would like an option to simply specify the path of
>>> the kernel source for the build to use.
>>>
>>> Any suggestions would be appreciated.
>>>        
>> Have you found the solution?
>>      
> I'd like to do that as well.  I can modify my "build" script to
> automagically generate patches against a vanilla source tree
> each time, but that seems rather obtuse.
>
>    

A number of people have submitted patches for this to the list, 
including myself. At some point this week I will be submitting my 
cleaned up patch as a bug.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
