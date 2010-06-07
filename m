From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jun 2010 00:04:15 +0200
Subject: [Buildroot] [PATCH] target skeleton definition
In-Reply-To: <87d3w2k0e0.fsf@macbook.be.48ers.dk>
References: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com>
	<20100607230541.5f2bf769@surf> <87d3w2k0e0.fsf@macbook.be.48ers.dk>
Message-ID: <20100608000415.543cae7d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 07 Jun 2010 23:17:59 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> Personaly, I'd prefer if we could get rid of the "busybox"
>  Thomas> skeleton altogether. I think Peter Korsgaard agreed with
>  Thomas> this decision, but I'll let him restate his preference here.
> 
> Yes, I think now would be a good moment to cleanup this stuff.

So, Dmytro, could you update your patch to remove the busybox skeleton,
and just put the default skeleton in fs/skeleton ?

You could indeed split it in two patches:

 * One doing the skeleton move

 * One adding the option to configure the skeleton

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
