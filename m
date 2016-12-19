From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Dec 2016 23:36:02 +0100
Subject: [Buildroot] [PATCH v3,3/3] soletta: new package
In-Reply-To: <CAPi7W839KFC4Y1QgGsfH0uCe8PTp-DQzLD2GDLqFO4s-RdoAdg@mail.gmail.com>
References: <1482101300-9180-1-git-send-email-fabrice.fontaine@orange.com>
 <1482101300-9180-3-git-send-email-fabrice.fontaine@orange.com>
 <20161219231208.46c66492@free-electrons.com>
 <CAPi7W839KFC4Y1QgGsfH0uCe8PTp-DQzLD2GDLqFO4s-RdoAdg@mail.gmail.com>
Message-ID: <20161219233602.4ecc09a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 23:25:41 +0100, Fabrice Fontaine wrote:

> I perfectly understand your point, thanks a lot for the time you passed on
> testing these patches.

Maybe you could set up an older Linux system to use as a build
environment to reproduce those failures. If you're using a Debian-based
system, it's really easy with debootstrap to create a chroot containing
an older Debian version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
