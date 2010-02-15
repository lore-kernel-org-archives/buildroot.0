From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 15 Feb 2010 17:43:50 +0000 (UTC)
Subject: [Buildroot] Using an external Linux tree
References: <4B792E68.6020907@heig-vd.ch>
Message-ID: <hlc14m$tmh$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-02-15, Marc Garnier <marc.garnier@heig-vd.ch> wrote:

> *Cliff Holden* Cliff.Holden at Atheros.com:
>> I'm somewhat new to buildroot, but have been building kernels
>> for a while.  I have a general question:
>>
>> What is the proper procedure for using an external linux
>> kernel tree in the build?  Our SCC system (source code
>> control) is set up to have various kernel versions located in
>> a particular location.  If I could get buildroot to "point" to
>> this external kernel, it would be helpful.
>>
>> I did try the "advanced" options that allows the specification
>> of a kernel version and an external "patch" file, which is
>> close, but the custom kernel I have is not set up as a set of
>> patches.  I would like an option to simply specify the path of
>> the kernel source for the build to use.
>>
>> Any suggestions would be appreciated.
>
> Have you found the solution?

I'd like to do that as well.  I can modify my "build" script to
automagically generate patches against a vanilla source tree
each time, but that seems rather obtuse.

-- 
Grant Edwards                   grante             Yow! Are we live or on
                                  at               tape?
                               visi.com            
