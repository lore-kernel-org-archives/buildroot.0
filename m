From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 8 Mar 2008 09:45:58 -0300
Subject: [Buildroot] Build failure with busybox 1.9.1
In-Reply-To: <47D149B9.9060603@carallon.com>
References: <47D149B9.9060603@carallon.com>
Message-ID: <d6cda7730803080445w775ee23eq44b7434becf6701d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That file is usually at the target folder not package, which target
are you compiling to?

On Fri, Mar 7, 2008 at 10:57 AM, Will Wagner <will_wagner@carallon.com> wrote:
> Hi All,
>
>
>  Have just tried a new config from scratch and it is failing while
>  configuring busybox as there is no package/busybox/busybox-1.9.0.config
>  file, previously I think it used the 1.6.0 file.
>
>  I have fixed it by just going back to the 1.6.0 file - is that correct?
>
>  Thanks,
>
>  Will
>  --
>  ------------------------------------------------------------------------
>  Will Wagner                                     will_wagner at carallon.com
>  Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
>  Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
>  ------------------------------------------------------------------------
>
>
>  _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
