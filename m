From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 03 Aug 2009 11:10:31 +0200
Subject: [Buildroot] [Bug 355] Please update WebKit - it doesn't compile!
In-Reply-To: <20090802231258.C94BD777DF@busybox.osuosl.org>
References: <bug-355-163@https.bugs.busybox.net/>
	<20090802231258.C94BD777DF@busybox.osuosl.org>
Message-ID: <4A76A987.9010909@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bugzilla at busybox.net skrev:
> https://bugs.busybox.net/show_bug.cgi?id=355
> 
> 
> 
> 
> 
> --- Comment #6 from Dan Dart <dandart@googlemail.com>  2009-08-02 23:12:58 UTC ---
> How now do I get it to work? I get:
> 
> checking for libintl.h... no
> configure: error:
> *** You must have either have gettext support in your C library, or use the
> *** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html
> 
> Where is it looking? I have /usr/include/libintl.h in the libc6-dev package and
> gettext installed.
> 

Isn't this the target libintl.h?
The package/gettext/gettext.mk deletes libintl.h from
staging_dir/usr/include.


> Using Ubuntu 9.04.
> 
> 
