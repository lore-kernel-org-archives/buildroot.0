From: Atle Nissestad <atle@nissestad.no>
Date: Mon, 17 Dec 2007 14:05:55 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: package/ed
	package/hotplug package/tar p etc...
In-Reply-To: <20071217122910.3700C1200F2@busybox.net>
References: <20071217122910.3700C1200F2@busybox.net>
Message-ID: <200712171405.55842.atle@nissestad.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 17. December 2007 13:29:10 vanokuten at uclibc.org wrote:
> Author: vanokuten
> Date: 2007-12-17 04:29:06 -0800 (Mon, 17 Dec 2007)
> New Revision: 20656
>
> Log:
> Add support for GNU and kernel.org mirrors
>

> +config BR2_GNU_MIRROR
> +	string "GNU Software mirror"
> +	default "http://ftp.gnu.org"
> +	help
> +	  GNU has multiple software mirrors scattered around the world.
> +	  The following allows you to select your preferred mirror.
> +
> +	  Have a look on the gnu.org site for a list of mirrors, then enter
> +	  the URL to the base directory.  Examples:
> +
> +	     http://ftp.gnu.org/pub/gnu (XX = country code)
> +	     http://mirror.aarnet.edu.au/pub/gnu
> +

The default URL should be "http://ftp.gnu.org/gnu" 
or "http://ftp.gnu.org/pub/gnu" .

- Atle
