From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:51:09 +0100
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180323185942.60252-4-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 23 Mar 2018 20:59:41 +0200")
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>
Message-ID: <87po3t21cy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Release notes:
 >     https://webkitgtk.org/2018/03/12/webkitgtk2.20.0-released.html

 > No corresponding WebKit Security Advisory (WSA) has been published
 > for now.

 > This also adds a dependency on the woff2 package. In previous versions
 > WebKitGTK+ bundled a known-to-work snapshot of its Git repository due to
 > upstream not providing releases. The situation has changed and releases
 > are now available, and the bundled copy of woff2 has been removed.

 > Last but not least, this patch selects BR2_PACKAGE_WEBP_DEMUX, which is
 > now required.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 > ---
 > Changes v1 -> v2:
 >   - Marked as supported on AArch64, which is officially supported upstream.
 >   - Add upstream patch for fixing build failure with multimedia/XSLT
 >     support disabled.
 > ---
 >  ...ld-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch | 32 ++++++++++++++++++++++
 >  package/webkitgtk/Config.in                        |  3 ++
 >  package/webkitgtk/webkitgtk.hash                   |  8 +++---
 >  package/webkitgtk/webkitgtk.mk                     |  4 +--

Your introductory mail talked about 3 additional patches needed for
aarch64 support, but I don't see them here?

-- 
Bye, Peter Korsgaard
