From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Thu, 28 Aug 2008 00:23:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
In-Reply-To: <87vdxlu3zi.fsf@macbook.be.48ers.dk>
References: <20080827201919.E9B3DF8006@busybox.net>
	<20080828002656.GB10828@cloud.net.au>
	<87vdxlu3zi.fsf@macbook.be.48ers.dk>
Message-ID: <19195469.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I think that generally the package directory is over populated.
I would like to see a rule along the lines of:
SubMenu Entry = package/subdir
i.e 
package/base (minimum packages for uclibc)
package/x11r7 (X11r7 drivers)
package/xapps (x applications (only x))
package/utils (linux utilities)
package/network (network utilities)
package/block (block drivers etc like MTD
package/audio (alsa etc)
package/java (Already there)
package/xmlutils (libxml2 etc)
package/games (games)
package/graphics (GTK/QT/DirectFB packages)

I think 300 ish packages in one directory is a bit too much.
Each of these subdirs pretty much maps to a current menu entry
package/Config.in would become smaller and simpler

What do people think?
Dan

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-fltk-tp19189068p19195469.html
Sent from the BuildRoot mailing list archive at Nabble.com.
