From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Jan 2012 03:32:19 +0100
Subject: [Buildroot] [PATCH 0/3] Fix Mesa3D with OpenGL-ES support
In-Reply-To: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
References: <CAPeX=+tVeJ6wip9tXgte5-8+qFqdxGNPU4NfyrdPs-a7fS8gsg@mail.gmail.com>
Message-ID: <1327113142-19610-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi Ozgun,

 It's indeed not so easy to get the new mesa3d to compile...  This patch
series should fix things for you.

 Could you test them, and then reply to the final mail with a

Tested-by: Ozgun Gunay <ozgun.gunay@gmail.com>

Also report on which processor and toolchain you tested it.

 Oh, and if you need further patches to fix QtOpenGL, please contribute
them!

 Regards,
 Arnout

---
Arnout Vandecappelle (Essensium/Mind) (3):
      xproto_glproto: bump version to 1.4.14
      host-python: build shared library
      mesa3d: bump to 7.10.1 and add support for OpenGL-ES

 package/libxml2/libxml2.mk                     |    7 ++++---
 package/python/python.mk                       |    1 +
 package/x11r7/mesa3d/Config.in                 |    6 ++++++
 package/x11r7/mesa3d/mesa3d.mk                 |   12 ++++++++----
 package/x11r7/xproto_glproto/xproto_glproto.mk |    2 +-
 5 files changed, 20 insertions(+), 8 deletions(-)
