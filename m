From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 16 Jul 2008 15:50:46 -0300
Subject: [Buildroot] buildroot size ballooned
In-Reply-To: <487E1442.2040004@acsatlanta.com>
References: <mailman.29.1216219095.1344.buildroot@uclibc.org>
	<487E1442.2040004@acsatlanta.com>
Message-ID: <d6cda7730807161150u3c5589d6ld94ca37dfef26c27@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most likely there are new packages being enabled on the defconfig. Did
you check that?

On Wed, Jul 16, 2008 at 12:31 PM, Joseph G. Boike
<joe.boike@acsatlanta.com> wrote:
>
>> Date: Tue, 15 Jul 2008 21:52:10 -0600
>> From: "Nathanael D. Noblet" <nathanael@gnat.ca>
>> Subject: Re: [Buildroot] buildroot size ballooned
>> To: "Joseph G. Boike" <joe.boike@acsatlanta.com>
>> Cc: build root <buildroot@uclibc.org>
>> Message-ID: <487D706A.30908@gnat.ca>
>> Content-Type: text/plain; charset=ISO-8859-1; format=flowed
>>
>> Joseph G. Boike wrote:
>>
>>> Hi, my buildroot filesize had been around 3-4M (w/ r 22508)
>>> With r 225765 and building using at91sam9260dfc_defconfig the filesize
>>> has jumped to ~14M.
>>> Any thoughts on why?
>>> (I have kernel 2.6.26 now.  The kernel size has been fairly consistent
>>> around 1.5M.)
>>>
>>
>>
>> No idea, but a clarification, are you talking about buildroot's
>> outputted final rootfs, or buildroot project in svn?
>>
>>
> The final output file (rootfs.arm-2008xxxx.ext2.gz) to be burned into my
> serial flash.
> Regards,
> Joe
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
