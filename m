From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2010 12:41:26 +0100
Subject: [Buildroot] Remove the Glib 1.x / Gtk 1.x stack ?
In-Reply-To: <20100214122934.5aae9b87@surf>
References: <20100214122934.5aae9b87@surf>
Message-ID: <20100214124126.2b388c5c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Feb 2010 12:29:34 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Can't we just remove it from Buildroot ? If so, both libgtk12 and
> libglib12 can be removed.

Dillo needs to be removed as well. The version of Dillo we package,
0.8.6 is ancient, and depends on Gtk 1.2. However, the latest version
of Dillo available is 2.2, and relies on FLTK instead of GTK.

So either we remove Dillo as well, or we update it to 2.2.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
