From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Dec 2010 09:03:00 -0300
Subject: [Buildroot] [Bug 2875] Kernel doesn't build Ext2
	support	out-of-the-box
In-Reply-To: <87ei9aulza.fsf@macbook.be.48ers.dk>
References: <bug-2875-163@https.bugs.busybox.net/>	<20101222091404.B58E688F68@busybox.osuosl.org>	<87mxnyung0.fsf@macbook.be.48ers.dk>
	<20101222112350.7261db18@surf> <87ei9aulza.fsf@macbook.be.48ers.dk>
Message-ID: <4D11E8F4.103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/22/10 07:43, Peter Korsgaard wrote:

>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  >> I vote for WONTFIX.
> 
>  Thomas> Ok. I think the IPv6 could also be removed (it's not because you have
>  Thomas> an IPv6 capable toolchain that you necessarly want IPv6 in your kernel).
>  Thomas> The EABI one is more or less justified, because we would otherwise have
>  Thomas> hundreds of bug reports saying that userspace programs do not start.
> 
> Agreed.

Also ext2 can be used by ext3 and ext4 in the kernel, so it would make
things far more complicated.
