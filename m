From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 17 Dec 2007 19:55:02 +0200
Subject: [Buildroot] buildroot ARM, error during make / make source
In-Reply-To: <4766A681.2010803@gmx.net>
References: <4766A681.2010803@gmx.net>
Message-ID: <4766B7F6.8080104@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marco wrote:
> hello list,
> 
> obviously there is a problem with the receiving files example:
> 
> wget --passive-ftp  -P /mnt/svn/buildroot/dl /ed//ed-0.8.tar.bz2
> /ed//ed-0.8.tar.bz2: Nicht unterst??tztes Schema.
> 
> same happened also to gdb
> ciao marco
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Try to check in your config:
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org"

I made a commit today introducing mirrors for KERNEL and GNU packages
May be you need to adjust your config.



Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
