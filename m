From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 19:34:14 +0200
Subject: [Buildroot] [PATCH 1/5] webkitgtk: bump to version 2.22.2
In-Reply-To: <20180922235333.85642-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 23 Sep 2018 02:53:29 +0300")
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-2-aperez@igalia.com>
Message-ID: <87bm8847s9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Release notes:
 >     https://webkitgtk.org/2018/09/03/webkitgtk2.22.0-released.html
 >     https://webkitgtk.org/2018/09/20/webkitgtk2.22.1-released.html
 >     https://webkitgtk.org/2018/09/21/webkitgtk2.22.2-released.html

 > No corresponding security advisories for 2.22.x have been published.
 > Nevertheless, due to skipping over versions in the 2.20.x series,
 > the following 2.20.x advisories apply:

 >     https://webkitgtk.org/security/WSA-2018-0003.html
 >     https://webkitgtk.org/security/WSA-2018-0004.html
 >     https://webkitgtk.org/security/WSA-2018-0005.html
 >     https://webkitgtk.org/security/WSA-2018-0006.html

 > This also bumps the required GCC version, due to the WebKit code
 > now using more modern C++ features which were introduced in version
 > 6.x of the compiler. The dependency is propagated to the midori
 > package as well. Last but not least, BR2_PACKAGE_WEBP_DEMUX and
 > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX are selected as
 > they are unconditionally needed by the newer WebKitGTK+ releases
 > when multimedia support is enabled.

 > An upstream patch for 32-bit ARM which did not make it to be included
 > in this new version is included as well, and can be removed once it
 > gets picked in a new release.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
