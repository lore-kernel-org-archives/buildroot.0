From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 09:40:34 +0000
Subject: [Buildroot] [Bug 12901] GStreamer doesn't build on 2020-05 rc1 with
 GObject introspection enabled (wrong path for g-ir-scanner)
In-Reply-To: <bug-12901-163@https.bugs.busybox.net/>
References: <bug-12901-163@https.bugs.busybox.net/>
Message-ID: <bug-12901-163-cUePAQ3GWl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12901

--- Comment #2 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
Hi,

Thanks for the bug report, this is a known issue, all meson packages fail to
build with gobject-introspection.

You can find a patch fixing this issue here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200502060435.23004-1-james.hilliard1 at gmail.com/. 

However, this patch has not been merged and probably won't be. James waits for
the next meson release before sending an updated version of this patch (see
https://patchwork.ozlabs.org/project/buildroot/patch/20200315172459.881615-2-aduskett at gmail.com/)

Best Regards,

Fabrice

-- 
You are receiving this mail because:
You are on the CC list for the bug.
