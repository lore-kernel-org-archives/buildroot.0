From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 22:58:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.26.2
In-Reply-To: <20191110162503.3529982-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 10 Nov 2019 18:25:03 +0200")
References: <20191110162503.3529982-1-aperez@igalia.com>
Message-ID: <87bltbv5zh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a minor release which includes fixes for CVE-2019-8812 and
 > CVE-2019-8814.

 > This release also fixes the build with WebDriver disabled, making patch
 > "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch" unneeded
 > (and therefore removed). There is also a performance improvement for
 > a regression related to fallback font selection, and a couple of small
 > fixes. The full release notes are available at:

 >   https://wpewebkit.org/release/wpewebkit-2.26.2.html

 > The detailed security advisory can be found at:

 >   https://wpewebkit.org/security/WSA-2019-0006.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

How about the corresponding bump of webkitgtk?

-- 
Bye, Peter Korsgaard
