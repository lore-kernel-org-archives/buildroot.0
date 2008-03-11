From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 20:12:37 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20080311181532.39F43120135@busybox.net> (ninevoltz@uclibc.org's
	message of "Tue\, 11 Mar 2008 11\:15\:32 -0700 \(PDT\)")
References: <20080311181532.39F43120135@busybox.net>
Message-ID: <87tzjdt6qi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

 ninevoltz> Author: ninevoltz
 ninevoltz> Date: 2008-03-11 11:15:30 -0700 (Tue, 11 Mar 2008)
 ninevoltz> New Revision: 21301

 ninevoltz> Log:
 ninevoltz> added debug option

 ninevoltz> +ifeq ($(BR2_ENABLE_DEBUG),y)
 ninevoltz> +ENABLE_DEBUG:=--enable-debug
 ninevoltz> +else
 ninevoltz> +ENABLE_DEBUG:=
 ninevoltz> +endif

What about the corresponding Kconfig option to actually set this?



-- 
Bye, Peter Korsgaard
