From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 15:30:21 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <87iqy713d1.fsf@macbook.be.48ers.dk>
References: <20080424184430.B4D613C849@busybox.net>
	<87iqy713d1.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670804241230k2fe7dd25p3d2fa0f5650107ef@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would assume it was due to changes in the build from the different
snapshot versions of qtopia. The commit log goes like this:
------------------------------------------------------------------------
r382 | thiago.correa | 2008-04-07 16:00:23 -0400 (Mon, 07 Apr 2008) | 1 line

Fix problem with qmake generaged makefiles unable to find the toolchain
------------------------------------------------------------------------
r366 | john.voltz | 2008-04-04 13:57:27 -0400 (Fri, 04 Apr 2008) | 1 line

update qtopia 4 file version
------------------------------------------------------------------------
r319 | thiago.correa | 2008-03-27 14:34:10 -0400 (Thu, 27 Mar 2008) | 1 line

Sync upstream -r 21517 (buildroot.uclibc.org)
------------------------------------------------------------------------


On Thu, Apr 24, 2008 at 3:04 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
>
>  ninevoltz> Author: ninevoltz
>  ninevoltz> Date: 2008-04-24 11:44:30 -0700 (Thu, 24 Apr 2008)
>  ninevoltz> New Revision: 21851
>
>  ninevoltz> Log:
>  ninevoltz> update qtopia snapshot version and fix problem with qmake
>  ninevoltz> generated makefiles being unable to find the toolchain
>
> What about all the config changes? Why don't you comment on them? Why
> are you changing it?
>
>  ninevoltz> Modified:
>  ninevoltz>    trunk/buildroot/package/qtopia4/Config.in
>  ninevoltz>    trunk/buildroot/package/qtopia4/qtopia4.mk
>
>
>  ninevoltz> Changeset:
>  ninevoltz> Modified: trunk/buildroot/package/qtopia4/Config.in
>  ninevoltz>
> ===================================================================
>  ninevoltz> --- trunk/buildroot/package/qtopia4/Config.in       2008-04-24
> 18:35:44 UTC (rev 21850)
>  ninevoltz> +++ trunk/buildroot/package/qtopia4/Config.in       2008-04-24
> 18:44:30 UTC (rev 21851)
>  ninevoltz> @@ -12,6 +12,7 @@
>  ninevoltz>     bool "Compile with debug support"
>  ninevoltz>     default n
>  ninevoltz>     depends BR2_PACKAGE_QTOPIA4
>  ninevoltz> +   help
>
> Why?
>
>  ninevoltz> +qtopia4-status:
>  ninevoltz> +   @echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
>  ninevoltz> +   @echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)
>
> What is that for?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/c7c3493e/attachment-0001.htm 
