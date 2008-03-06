From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Mar 2008 22:41:23 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sylpheed
In-Reply-To: <20080306182643.988A1120281@busybox.net> (ninevoltz@uclibc.org's
	message of "Thu\, 6 Mar 2008 10\:26\:43 -0800 \(PST\)")
References: <20080306182643.988A1120281@busybox.net>
Message-ID: <87ve3zedj0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:

Hi,

 ninevoltz> @@ -0,0 +1,7 @@
 ninevoltz> +config BR2_PACKAGE_SYLPHEED
 ninevoltz> +	bool "sylpheed"
 ninevoltz> +	default n
 ninevoltz> +	help
 ninevoltz> +	  lightweight and user-friendly e-mail client.
 ninevoltz> +
 ninevoltz> +	  http://sylpheed.sraoss.jp/sylpheed/v2.4

Maybe add an EMAIL submenu and stick it there together with mutt?


-- 
Bye, Peter Korsgaard
