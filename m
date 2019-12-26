From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 17:14:59 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/ecryptfs-utils: fix parallel build
In-Reply-To: <CAPi7W80FCGUXuLX-Ciye2honL8TeE4KHT3Ljkhc=1XkFLQHKeg@mail.gmail.com>
References: <20191226150330.3414899-1-fontaine.fabrice@gmail.com>
 <20191226161008.7ee0166a@windsurf>
 <CAPi7W80FCGUXuLX-Ciye2honL8TeE4KHT3Ljkhc=1XkFLQHKeg@mail.gmail.com>
Message-ID: <20191226171459.6817065c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 16:34:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Yes, it is provided by libglib2 but we definitely does not want to depend on it.
> I saw that this issue was already raised by avahi in 2014:
> http://lists.busybox.net/pipermail/buildroot/2014-November/111185.html.
> After reading the 4 proposals from this thread, I decided to go to the
> third one as the package already has a dependency on host-intltool.
> But frankly, upstream seems pretty much dead (no updates since June
> 2017) so my preferred option would be to just disable parallel build.

Then perhaps we should make an exception and patch the Makefile.in
directly?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
