From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 22:10:21 +0100
Subject: [Buildroot] [PATCH 05/34] package: create virtual package for
	libGLES, libOpenVG and libEGL
In-Reply-To: <1362601396-32250-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 6 Mar 2013 21:22:47 +0100")
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874ngo6xqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Those acceleration libraries typically have multiple implementations:
 Thomas> some are free (Mesa), some are proprietary (generally SoC specific).

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                     |    1 +
 Thomas>  package/opengl/Config.in              |    8 ++++++++
 Thomas>  package/opengl/libegl/libegl.mk       |   16 ++++++++++++++++
 Thomas>  package/opengl/libgles/libgles.mk     |   16 ++++++++++++++++
 Thomas>  package/opengl/libopenvg/libopenvg.mk |   16 ++++++++++++++++
 Thomas>  package/opengl/opengl.mk              |    1 +
 Thomas>  6 files changed, 58 insertions(+)
 Thomas>  create mode 100644 package/opengl/Config.in
 Thomas>  create mode 100644 package/opengl/libegl/libegl.mk
 Thomas>  create mode 100644 package/opengl/libgles/libgles.mk
 Thomas>  create mode 100644 package/opengl/libopenvg/libopenvg.mk
 Thomas>  create mode 100644 package/opengl/opengl.mk

Committed, thanks.

I personally don't really like the opengl subdir, and I think we need to
be clear about what we mean when we say opengles (E.G. v1/v2/v3), but we
can fix that up later.

-- 
Bye, Peter Korsgaard
