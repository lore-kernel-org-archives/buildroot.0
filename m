From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 08 Apr 2008 19:57:27 +0000
Subject: [Buildroot] [PATCH] SCREEN: Added support for GNU Screen
In-Reply-To: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
Message-ID: <1207684648.6817.280.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> --- /dev/null
> +++ b/package/screen/screen-4.0.2-100-cross-compile.patch
> @@ -0,0 +1,967 @@
> +diff -c screen.orig/configure screen-4.0.2/configure
> +*** screen.orig/configure	2003-12-05 13:46:53.000000000 +0000
> +--- screen-4.0.2/configure	2008-04-05 18:48:27.000000000 +0100
<snip>

Can we not modify configure.ac/in and autoreconf?  (assuming configure
is originally built from configure.in or configure.ac)

-N

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080408/325d1c54/attachment.pgp 
