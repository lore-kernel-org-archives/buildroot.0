From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 20:52:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <871vvk17mo.fsf@macbook.be.48ers.dk>
References: <20090103010637.58207769FD@busybox.osuosl.org>
	<871vvk17mo.fsf@macbook.be.48ers.dk>
Message-ID: <1231012341.8886.115.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
>  ulf>  config BR2_KERNEL_LATEST_2_6_27
>  ulf> -       string
>  ulf> -       default "10"
>  ulf> +	string
>  ulf> +	default "10"
> 
> Whitespace damage?
> 
> 
>  ulf>  config BR2_KERNEL_LATEST_2_6_26
>  ulf> -       string
>  ulf> -       default "8"
>  ulf> +	string
>  ulf> +	default "8"
> 
> And here.
> 
>  ulf>  config BR2_KERNEL_LATEST_2_6_25
>  ulf> -       string
>  ulf> -       default "9"
>  ulf> +	string
>  ulf> +	default "9"
> 
> And so on ..
> 

Don't see any whitespace damage in my file, there is a TAB character
at the beginning of each line instead of 8 space characters.


As for comments on ?24465:
Yes, I consider it an improvement that all (except one)
thing that regularily changes is located in a separate file.

I do not think it is a good idea to remove support for kernel versions
and I do not think it is a good idea to deprecate them.
I fail to see any significant benefit in doing this, 
and I can foresee substantial drawbacks for individual users.

The deprecation of binutils-2.17 has, as you know caused
extra work, which we all could benefit from avoiding.

The only significant drawback of keeping multiple choice,
is that the list of choices grow.
By sorting the list of choices in reverse order,
this is more or less nullified,.


> Please fix.
> 
