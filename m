From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 21:42:05 +0100
Subject: [Buildroot] [PATCH 12/19] package/libseccomp: new package
In-Reply-To: <871uepd968.fsf@dell.be.48ers.dk>
References: <cover.1355676845.git.yann.morin.1998@free.fr>
 <caac6f2b10b2b3a3d473e552c106e9e748243cf9.1355676845.git.yann.morin.1998@free.fr>
 <871uepd968.fsf@dell.be.48ers.dk>
Message-ID: <201212162142.06073.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 16 December 2012 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
>  Yann> diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
>  Yann> new file mode 100644
>  Yann> index 0000000..183cf4e
>  Yann> --- /dev/null
>  Yann> +++ b/package/libseccomp/Config.in
>  Yann> @@ -0,0 +1,13 @@
>  Yann> +config BR2_PACKAGE_LIBSECCOMP
>  Yann> +	bool "libseccomp"
>  Yann> +	help
>  Yann> +	  High level interface to the Linux Kernel's seccomp filter 
>  Yann> +	  
>  Yann> +	  The libseccomp library provides and easy to use, platform independent,
> 
> s/and/an/. I know this is just cut'n'pasted from the sf.net website, but
> I've fixed it anyway and committed, thanks.

Thank you!

Regards,
Yamnn E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
