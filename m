From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Dec 2016 20:14:02 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/efl: enable libdrm support
In-Reply-To: <1481235857-23293-1-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Thu, 8 Dec 2016 23:24:16 +0100")
References: <1481235857-23293-1-git-send-email-romain.naour@gmail.com>
Message-ID: <874m2cgbk5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > drm can be used without compositor, just like it was with
 > the framebuffer for standalone applications

 > As stated in configure.ac, libdrm support needs libdrm, elput,
 > libxkbcommon and libgbm.

 > libgbm is only provided by mesa3d package when OpenGL EGL support is
 > enabled, so add a direct dependency on mesa3d.

 > Rework the libxkbcommon dependency since it's now required for
 > elput and libdrm support.

 > [1] https://www.enlightenment.org/about-wayland

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Pierre Floury <devpfl@gmail.com>
 > ---
 > libgdm can be found as a standalone library on github [2] but it seems
 > not very active. I prefer to rely on Mesa3d version.
 > [2] https://github.com/robclark/libgbm

Committed, thanks.

-- 
Bye, Peter Korsgaard
