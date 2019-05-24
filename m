From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 16:36:20 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/webkitgtk: bump to version
 2.24.2
In-Reply-To: <20190522082734.33964-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 22 May 2019 11:27:34 +0300")
References: <20190522082734.33964-1-aperez@igalia.com>
Message-ID: <8736l3rkbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a new major release which brings in many improvements and new
 > features. For a complete list, please refer to the release notes:

 >   https://webkitgtk.org/2019/03/13/webkitgtk2.24.0-released.html
 >   https://webkitgtk.org/2019/04/09/webkitgtk2.24.1-released.html
 >   https://webkitgtk.org/2019/05/17/webkitgtk2.24.2-released.html

 > Updating to version 2.24.2 also includes fixes for CVE-2019-6201,
 > CVE-2019-6251, CVE-2019-7285, CVE-2019-7292, CVE-2019-8503,
 > CVE-2019-8506, CVE-2019-8515, CVE-2019-8518, CVE-2019-8523,
 > CVE-2019-8524, CVE-2019-8535, CVE-2019-8536, CVE-2019-8544,
 > CVE-2019-8551, CVE-2019-8558, CVE-2019-8559, CVE-2019-8563,
 > CVE-2019-11070, CVE-2019-6237, CVE-2019-8571, CVE-2019-8583,
 > CVE-2019-8584, CVE-2019-8586, CVE-2019-8587, CVE-2019-8594,
 > CVE-2019-8595, CVE-2019-8596, CVE-2019-8597, CVE-2019-8601,
 > CVE-2019-8607, CVE-2019-8608, CVE-2019-8609, CVE-2019-8610,
 > CVE-2019-8615, CVE-2019-8611, CVE-2019-8619, CVE-2019-8622, and
 > CVE-2019-8623.

 > The detailed security advisories can be found at:

 >   https://webkitgtk.org/security/WSA-2019-0002.html
 >   https://webkitgtk.org/security/WSA-2019-0003.html

 > The BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT configuration symbol is not
 > needed anymore, because the logic to decide whether the JavaScriptCore
 > JIT spport can be enabled has been improved upstream.

 > One of the new features in 2.24.x is the support for JPEG2000 images,
 > which is implemented using the OpenJPEG library. Therefore now
 > BR2_PACKAGE_OPENJPEG is selected.

 > This adds one small patch which did not make it to the 2.24.2 release
 > which solves a build issue when the building the GStreamer GL elements
 > is disabled.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I know you marked this for next, but given the security fixes I have
applied it for master, thanks.

-- 
Bye, Peter Korsgaard
