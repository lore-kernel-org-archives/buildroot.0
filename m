From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Apr 2010 16:45:04 +0200
Subject: [Buildroot] Anyone working on install-able packages (ipkg)
In-Reply-To: <4BC61E50.4000902@gmail.com>
References: <4BC61E50.4000902@gmail.com>
Message-ID: <20100415164504.11822b4a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paulius,

On Wed, 14 Apr 2010 22:58:08 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> Soon I should start work on install-able packages with ipkg.
> Actually I am thinking about opkg instead of ipkg, but that doesn't
> make any real difference.
> A lot of work is waiting ahead, so maybe someone is already working
> on this?

I am not *yet* directly working on this, but in fact all the work I've
been doing the last six months on the package infrastructure and the
conversion of packages to these infrastructures is in preparation of
the support of packages.

Some help going into this direction will be very appreciated. Let's
discuss on the list the rough design ?

During the Buildroot meeting at Brussels in February, we discussed how
we wanted to implement package removal, i.e be able to unselect a
package from menuconfig and then remove it cleanly from $(STAGING_DIR)
and $(TARGET_DIR). I think that some of the work required to do this
might be common with package support. I'll clean up my notes and share
them on the list.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
