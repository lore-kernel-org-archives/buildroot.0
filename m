From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 18:53:03 +0200
Subject: [Buildroot] psplash and systemd
In-Reply-To: <5395D4CA.9060606@gmail.com>
References: <537C657F.4090106@ebo-enterprises.com> <20140521192928.GA3672@ned>
 <20140609142734.32d58a30@free-electrons.com>
 <5395D4CA.9060606@gmail.com>
Message-ID: <20140609185303.799e3396@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tom Deblauwe,

On Mon, 09 Jun 2014 17:37:46 +0200, Tom Deblauwe wrote:

> I also have added some basic support to choose the .png image you want 
> as a bootscreen. I had to install in ubuntu "libgdk-pixbuf2.0-dev" to 
> have the "gdk-pixbuf-csource" utility which the generate header script 
> uses. Probably there is a better buildroot-specific way but I provide 
> the patch as a start.

Thanks for your patch. To get the gdk-pixbuf-csource tool in Buildroot,
you simply need to make your package depend on host-gdk-pixbuf.

It would be good to take the systemd psplash patch and your patch,
create proper commit logs, and submit them using git send-email. See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for details. Your contribution would be much appreciated!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
