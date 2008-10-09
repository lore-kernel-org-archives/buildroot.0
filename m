From: Ormund Williams <ormundw@panix.com>
Date: Wed, 08 Oct 2008 21:25:52 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <20081007202927.B2E04F802A@busybox.net>
References: <20081007202927.B2E04F802A@busybox.net>
Message-ID: <1223515552.3276.52.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2008-10-07 at 13:29 -0700, correa at uclibc.org wrote:
> Author: correa
> Date: 2008-10-07 13:29:27 -0700 (Tue, 07 Oct 2008)
> New Revision: 23621
> 
> Log:
> widen options to configure directfb, patch by Micha Nelissen <micha@neli.hopto.org>
> 
> Modified:
>    trunk/buildroot/package/directfb/Config.in
>    trunk/buildroot/package/directfb/directfb.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/directfb/Config.in
> ===================================================================
> --- trunk/buildroot/package/directfb/Config.in	2008-10-07 17:08:27 UTC (rev 23620)
> +++ trunk/buildroot/package/directfb/Config.in	2008-10-07 20:29:27 UTC (rev 23621)
> @@ -1,15 +1,10 @@
--snip--

I get the following error with this patch:

checking for directfb-csource... no
configure: error: Could not find a directfb-csource in your PATH
make: ***
[/home/ormund/buildroot/buildroot/build_i686/DirectFB-1.2.6/.configured]
Error 1


__
Ormund
