From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 21:09:39 +0100
Subject: [Buildroot] Need clarification about glib and dbus
In-Reply-To: <CAHXCMMJdivKo-5LGJwDjB_zQg5yrtCFsTg_xBhCJ=wgHoK_cNw@mail.gmail.com>
References: <WC20150211154820.183108@til-technologies.fr>
 <CAHXCMMJdivKo-5LGJwDjB_zQg5yrtCFsTg_xBhCJ=wgHoK_cNw@mail.gmail.com>
Message-ID: <20150211210939.7574bfe7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 11 Feb 2015 17:56:55 +0100, Samuel Martin wrote:

> 0.102 is the dbus-glib version, which is obvioulsy not synchronized
> with the version of glib (the libglib2 package in buildroot).
> Buildroot certainly builds dbus-glib (otherwise there should be some
> entry in the autobuilders [1]), even if it is mark as deprecated by
> freedesktop developers.

Then we should update the Config.in help text of the dbus-glib package
to indicate this, I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
