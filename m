From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 3 Aug 2017 14:28:05 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add patch for properly
 picking GL flags when building
In-Reply-To: <20170803112253.26619-1-aperez@igalia.com>
References: <20170803112253.26619-1-aperez@igalia.com>
Message-ID: <20170803142805.GB551@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Aug 2017 14:22:53 +0300, Adrian Perez de Castro <aperez@igalia.com> wrote:
> This solves build failures caused by WebKit trying to include X11 headers
> when support for X11 is disabled in Mesa3D. A common situation is when
> configuring both GTK+ and WebKitGTK+ only with Wayland support.
> 
> Once the fix for https://bugs.webkit.org/show_bug.cgi?id=175125 makes it
> into a release, the patch can be dropped.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Don't commit this. I forgot again to remove the hunk for the ChangeLog edits.
I'll submit a v2 in a minute :-\


--
 Adri?n ?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170803/2c3ac030/attachment.asc>
