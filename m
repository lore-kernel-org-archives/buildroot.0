From: Adam McLaurin <buildroot@irotas.net>
Date: Mon, 27 Oct 2008 09:21:34 -0400
Subject: [Buildroot] Unable to create files inside mounted root
	filesystem
In-Reply-To: <e4c675870810270615n2bb4e9dbwf86044668db35ad2@mail.gmail.com>
References: <1225112903.16248.1281448757@webmail.messagingengine.com>
	<e4c675870810270615n2bb4e9dbwf86044668db35ad2@mail.gmail.com>
Message-ID: <1225113694.19430.1281451485@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Oct 2008 14:15:12 +0100, "Roberto A. Foglietta"
<roberto.foglietta@gmail.com> said:
> 2008/10/27 Adam McLaurin <buildroot@irotas.net>:
>  Welcome, I am newbie in buildroot me too, try this:
> 
>  mount -o remount,rw /
> 
>  It was useful in my bootable iso9660 from buildroot
> 
>  Cheers,


Thanks for the advice. I tried what you suggested, but no luck:
/ # mount -o remount,rw /
mount: cannot read /proc/mounts: No such file or directory

Indeed, /proc is entirely empty. However, it is also empty when I mount
the pre-built filesystem (from uclibc's website), so I don't think
that's a problem.

-Adam
