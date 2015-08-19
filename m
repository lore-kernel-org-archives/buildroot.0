From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 11:11:11 +0200
Subject: [Buildroot] Web user interface for Buildroot
In-Reply-To: <alpine.DEB.2.02.1508190647370.26165@orcam81.orcam.lan>
References: <55D3C27E.9000500@mail.bg>
 <alpine.DEB.2.02.1508190647370.26165@orcam81.orcam.lan>
Message-ID: <20150819111111.7a6e12b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben Avraham,

On Wed, 19 Aug 2015 07:00:43 +0300 (IDT), Jonathan Ben Avraham wrote:

> By design, Buildroot isn't a Linux distribution like OpenWRT or Debian, so 
> it doesn't have it's own userspace tools for system configuration. In 
> fact, Buildroot isn't necessarily for Linux only, although most 
> applications that use Buildroot are in fact Linux-based.

This isn't quite correct: Buildroot only supports Linux as an operating
system, and is only capable of generating Linux-based systems. At least
as of today.

That being said, you are right that we differ from other systems such
as OpenWRT in that we don't try to generate out of the box something
that looks like a product. We simply package existing open-source
software, make it easy to build all of them together, but we leave it
to the user to add the product/project specific additions such as web
interface, custom applications, etc.

Nikolay: we provide packages for many web servers, and also for many
Javascript libraries, which you can use to build your own web interface.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
