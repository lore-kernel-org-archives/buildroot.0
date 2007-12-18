From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2007 14:22:57 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: package/ed
	package/hotplug package/tar p etc...
In-Reply-To: <20071217122910.3700C1200F2@busybox.net> (vanokuten@uclibc.org's
	message of "Mon\, 17 Dec 2007 04\:29\:10 -0800 \(PST\)")
References: <20071217122910.3700C1200F2@busybox.net>
Message-ID: <87bq8o87da.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "vanokuten" == vanokuten  <vanokuten@uclibc.org> writes:

Hi,

 vanokuten> +config BR2_GNU_MIRROR
 vanokuten> +	string "GNU Software mirror"
 vanokuten> +	default "http://ftp.gnu.org"
 vanokuten> +	help
 vanokuten> +	  GNU has multiple software mirrors scattered around the world.
 vanokuten> +	  The following allows you to select your preferred mirror.
 vanokuten> +
 vanokuten> +	  Have a look on the gnu.org site for a list of mirrors, then enter
 vanokuten> +	  the URL to the base directory.  Examples:
 vanokuten> +
 vanokuten> +	     http://ftp.gnu.org/pub/gnu (XX = country code)

No XX.

-- 
Bye, Peter Korsgaard
