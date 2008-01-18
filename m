From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 18 Jan 2008 15:11:42 +0200
Subject: [Buildroot] [PATCH] more python enhancements
In-Reply-To: <20080118025745.GA30978@cloud.net.au>
References: <20080118025745.GA30978@cloud.net.au>
Message-ID: <4790A58E.8030009@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> Here's another improvement to the Python package.
> 
> 1. Don't install the development headers, tools and static library into
> the target system unless new configuration item is enabled.
> 
> 2. Always install the development headers etc into the staging_dir, so
> they can be used to build extension modules.
> 
> 
> Hamish
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Hi,

please supply correct patch (svn diff or diff -urN)

--- python.mk   (.../mirror/buildroot/package/python)   (revision 3461)
+++ python.mk   (.../beethoven/elara/trunk/buildroot/package/python)    (revision 3461)

I do not know how to apply it.



Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
