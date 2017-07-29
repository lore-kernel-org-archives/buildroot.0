From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 21:32:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Allow building with
 BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
In-Reply-To: <20170729135837.25668-1-aperez@igalia.com>
References: <20170729135837.25668-1-aperez@igalia.com>
Message-ID: <20170729213242.7de97ca4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 16:58:37 +0300, Adrian Perez de Castro wrote:
> Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
> missing feature dependency in the WebKitGTK+ build files. Additionally,
> a patch for https://bugs.webkit.org/show_bug.cgi?id=174940 is needed.
> 
> Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I have already applied your v1, which did not include the patch. Can
you send a follow-up patch instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
