From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Feb 2013 11:47:52 +0100
Subject: [Buildroot] Problem build haserl with lua support
In-Reply-To: <1359739826.4447.6.camel@john-ubu>
References: <1359630353.9888.41.camel@john-ubu> <20130131125234.166475a7@skate>
 <1359739826.4447.6.camel@john-ubu>
Message-ID: <20130202114752.6b5e1fb6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear john,

On Fri, 01 Feb 2013 17:30:26 +0000, john wrote:

> I was just wondering what would be involved in updating the package
> directory in Buildroot 2012.05 with the latest versions of haserl and
> lua. Is it simply a matter of lets say copying the relevant package
> directories for these appsa from buildroot-2012.11.1 into Buildroot
> 2012.05?

I think haserl and lua don't have many dependencies, so what you
suggest might work. Of course, if there are issues related to some
dependencies, you'd have to figure them out and fix them.

That said, instead of moving to new versions of those packages, you can
also just as well backport the patch I pointed to (but it may depend on
many other patches, since the Lua package has seen quite a number of
changes lately).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
