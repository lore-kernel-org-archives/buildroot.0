From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 29 Jul 2017 17:00:45 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Allow building with
 BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
In-Reply-To: <20170729153738.538fdd2b@windsurf.lan>
References: <20170729131844.3502-1-aperez@igalia.com>
 <20170729153738.538fdd2b@windsurf.lan>
Message-ID: <20170729170045.GD3704@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Jul 2017 15:37:38 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
> 
> On Sat, 29 Jul 2017 16:18:44 +0300, Adrian Perez de Castro wrote:
> > Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
> > missing feature dependency in the WebKitGTK+ build files.
> > 
> > Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/webkitgtk/webkitgtk.mk | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> Applied to master, thanks.

Ouch, I've just sent a v2 with an added patch. I'll send the patch addition as
a separate patch so please ignore the v2 then.

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170729/88ee5824/attachment.asc>
