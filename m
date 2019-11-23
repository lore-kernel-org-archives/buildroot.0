From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 11:57:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.26.2
In-Reply-To: <20191122180013.2887730-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 22 Nov 2019 20:00:13 +0200")
References: <20191122180013.2887730-1-aperez@igalia.com>
Message-ID: <87zhgmyi68.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a minor release which includes fixes for CVE-2019-8812 and
 > CVE-2019-8814.

 > This release also fixes the build with WebDriver disabled and without
 > X11, so "0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch"
 > and "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch" are not
 > needed anymore (and therefore removed). There is also a performance
 > improvement for a regression related to fallback font selection, and a
 > couple of small fixes. The full release notes are available at:

 >   https://webkitgtk.org/2019/11/06/webkitgtk2.26.2-released.html

 > The detailed security advisory can be found at:

 >   https://webkitgtk.org/security/WSA-2019-0006.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
