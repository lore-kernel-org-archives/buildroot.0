From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Dec 2016 20:14:09 +0100
Subject: [Buildroot] [PATCH v4 2/2] package/efl: add Wayland support
In-Reply-To: <1481235857-23293-2-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Thu, 8 Dec 2016 23:24:17 +0100")
References: <1481235857-23293-1-git-send-email-romain.naour@gmail.com>
 <1481235857-23293-2-git-send-email-romain.naour@gmail.com>
Message-ID: <87zik4ewzi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The EFL Wayland support was removed with commit [1] since the dependecy
 > on libdrm was missing. Also it requires OpenGL ES with EGL, Evas DRM
 > and Evas GLES DRM support [2].

 > As stated in configure, Evas GLES DRM engine support (gl_drm) depends
 > on wayland-client to build (wayland-client >= 1.8.0).

 > So, enable gl_drm only when wayland support is selected.

 > [1] 4f04be1659f186765f506c68f5bfbf6845fc40dc
 > [2] https://www.enlightenment.org/about-wayland

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Pierre Floury <devpfl@gmail.com>
 > ---
 > v4: new patch
 >     merge Evas GL DRM Engine support and with Wayland support

Committed, thanks.

-- 
Bye, Peter Korsgaard
