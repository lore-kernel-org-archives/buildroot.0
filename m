From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Jul 2020 23:15:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdk-pixbuf: add
 gobject-introspection support
In-Reply-To: <20200606083438.1317261-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Jun 2020 10:34:37 +0200")
References: <20200606083438.1317261-1-fontaine.fabrice@gmail.com>
Message-ID: <87d05964uh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will fix the following build failure when enabling introspection on
 > libgtk2:

 > Couldn't find include 'GdkPixbuf-2.0.gir' (search path: '['/tmp/instance-0/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '../gdk', '/tmp/instance-0/output-1/host/share', 'gir-1.0', '/tmp/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')

 > Fixes:
 >  - http://autobuild.buildroot.org/results//86c6f55e0bd1a0fe3b70c9e97193aaad94d72a7f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
