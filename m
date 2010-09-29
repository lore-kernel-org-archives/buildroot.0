From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 08:29:14 +0200
Subject: [Buildroot] [PATCH 1/3] libgtk2: bump to version 2.20.1 and
 mark Gtk/DirectFB as broken
In-Reply-To: <1285716520.27944.304.camel@coalu.atr>
References: <cover.1285711882.git.thomas.petazzoni@free-electrons.com>
	<ca402fe6cbeeefeb15711d9e7f2390fab54c17b8.1285711883.git.thomas.petazzoni@free-electrons.com>
	<1285716520.27944.304.camel@coalu.atr>
Message-ID: <20100929082914.3185053a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Sep 2010 01:28:40 +0200
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> Gtk+ 2.22 has been released early this week, it brings back
> compiling/quite-good-working DirectFB backend.
> 
> Would you consider bumping to 2.22 ?

Argh, I checked http://www.gtk.org/download-linux.html yesterday, and
it still advertise Gtk 2.20 and Glib 2.24.

I will bump those versions, yes, and mark the DirectFB support as
working again.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
