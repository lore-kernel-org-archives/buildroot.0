From: Maxim Grigoriev <maxim@tensilica.com>
Date: Wed, 21 Jan 2009 09:13:40 -0800
Subject: [Buildroot] Need some help with uClibc build
In-Reply-To: <87zlhltbvb.fsf@macbook.be.48ers.dk>
References: <49768405.20909@hq.tensilica.com>
	<87zlhltbvb.fsf@macbook.be.48ers.dk>
Message-ID: <497757C4.8000909@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your advice, Peter.

You suggest to keep it simple - the latest versions of the tools
and libraries are the best to try.

I will switch to uclibc 0.9.30 and gcc 4.3.2.

-- Maxim


Peter Korsgaard wrote:
>
>  Maxim> Can somebody, please, help me.
>  Maxim> I seem to be missing something trivial like the fact that
>  Maxim> gcc-4.3.1+ would not work with uClibc-0.9.29, or something
>  Maxim> like this.
>
> That could very well be - uClibc 0.9.29 is old, and gcc 4.3.x is
> pretty new.
>
>  Maxim> I'm trying to build buildroot with
>
>  Maxim>     binutils-2.19
>  Maxim>     uClibc-0.9.29
>  Maxim>     gcc-4.3.1
>
> Why would you want to use those versions instead of the stable and
> recommended ones? (uclibc 0.9.30, gcc 4.3.2)?
>
>   
