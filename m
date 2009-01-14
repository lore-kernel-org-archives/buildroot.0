From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 14 Jan 2009 09:11:04 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: atk iptables
	java/classpath java/jamvm
In-Reply-To: <20090113210244.C2A7E76C8E@busybox.osuosl.org>
References: <20090113210244.C2A7E76C8E@busybox.osuosl.org>
Message-ID: <20090114081104.GA11127@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 13, 2009 at 09:02:44PM +0000, ulf at uclibc.org wrote:
> 
> Log:
> Use HOST_GLIB for glib installation instead of /usr/bin
>  
> +ATK_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums

Any reason we do this instead of using good old PATH? 
Using PATH and having STAGING_DIR/BIN first in it will give the user an option 
to choose wether he wants to use the host provided or his own.


Thomas.
