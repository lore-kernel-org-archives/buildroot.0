From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 09 Feb 2012 17:16:51 +0200
Subject: [Buildroot] segfault when running a simple c program on env
 build with buildroot
In-Reply-To: <20120209161150.36d6c6d6@skate>
References: <4F33DCBE.7080606@scalemp.com> <20120209161150.36d6c6d6@skate>
Message-ID: <4F33E363.5040107@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/2012 05:09 PM, Thomas Petazzoni wrote:

> Le Thu, 09 Feb 2012 16:48:30 +0200,
> Eial Czerwacki <eial@scalemp.com> a ?crit :
>
>> my buildroot config is attached and the version in use a snapshot from
>> the date 10/9/2011.
>
> What is your hardware platform?
>
> Thomas

any generic Intel/AMD cpu

On 02/09/2012 05:11 PM, Thomas Petazzoni wrote:

> Le Thu, 09 Feb 2012 16:48:30 +0200,
> Eial Czerwacki <eial@scalemp.com> a ?crit :
> 
>> sh-4.1# gcc -o a test.c
> 
> You're using the native gcc on the target, while Buildroot is mostly
> designed for cross-compilation. Our native gcc on the target mechanism
> isn't used/tested a lot, so I would really recommend using the
> cross-compiler on the build machine to build your applications.
> 
> Thomas


I've compiled iasl, dmidecode and biosdecode with same image, you say
that I cannot do that?
I need the bin linked to uclibc and my desktop doesn't support uclibc

Thanks,

Eial.
