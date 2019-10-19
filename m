From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 19 Oct 2019 10:01:52 -0300
Subject: [Buildroot] [PATCH] package/libseccomp: circumvent uClibc-ng
 bug on x86_64
In-Reply-To: <20191019141746.3d1551f1@windsurf.home>
References: <20191019141746.3d1551f1@windsurf.home>
Message-ID: <4154F3C2-1876-461A-8AF2-9DCE7174E286@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Em 19 de out de 2019, ?(s) 09:17, Thomas Petazzoni <thomas.petazzoni@bootlin.com> escreveu:
> 
> ?Hello,
> 
>> On Fri, 18 Oct 2019 22:15:55 -0300
>> unixmania at gmail.com wrote:
>> 
>> On uClibc up to v1.0.31, syscall() for x86_64 is defined in
>> libc/sysdeps/linux/x86_64/syscall.S as
> 
> If it is "up to v1.0.31", then the problem is fixed in uClibc-ng. Why
> would we want to carry a work-around in libsseccomp ? To support older
> uClibc-ng pre-built toolchains ?

It?s not fixed in uClibc-ng, since there no version newer than 1.0.31.
> 
>> The same problem probably occurs on other 64-bit systems but so far only
>> x86_64 was tested.
>> 
>> A bug report is being submitted to uClibc.
> 
> But you said above it's already fixed in uClibc-ng, so ?

It?s not.

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://


Carlos Santos <unixmania@gmail.com>
