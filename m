From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 29 Jul 2017 23:27:32 +0300
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Allow building with
 BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
In-Reply-To: <20170729213242.7de97ca4@windsurf.lan>
References: <20170729135837.25668-1-aperez@igalia.com>
 <20170729213242.7de97ca4@windsurf.lan>
Message-ID: <20170729232732.GB25052@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Jul 2017 21:32:42 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
> 
> On Sat, 29 Jul 2017 16:58:37 +0300, Adrian Perez de Castro wrote:
> > Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
> > missing feature dependency in the WebKitGTK+ build files. Additionally,
> > a patch for https://bugs.webkit.org/show_bug.cgi?id=174940 is needed.
> > 
> > Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> I have already applied your v1, which did not include the patch. Can
> you send a follow-up patch instead ?

Of course! I have posted the follow-up patch a bit earlier today:

  https://patchwork.ozlabs.org/patch/795273/

With this one applied, I was able of making a build for the Raspberry Pi 3
with BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled.

(Sorry for the inconvenience, I should have checked that builds would succeed
before sending the v1 that you applied... WebKit builds take so long that
I assumed it would complete because the issue previusly reported was gone,
but I should have waited to make sure O:-|)

Regards,


--
 Adri?n ?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170729/06440c39/attachment.asc>
