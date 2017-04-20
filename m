From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 20 Apr 2017 19:32:51 -0300
Subject: [Buildroot] glmark2 regression on mx6
Message-ID: <CAOMZO5COcgkg7X1wpnqMfpD6=1YCqzmetMMCANrqbqA=a9moxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

I have just tested glmark2 with Buildroot master on imx6 and I got the
following error:

# glmark2-es2-drm
** Failed to set swap interval. Results may be bounded above by refresh rate.
=======================================================
    glmark2 2014.03
=======================================================
    OpenGL Information
    GL_VENDOR:     etnaviv
    GL_RENDERER:   Gallium 0.4 on Vivante GC2000 rev 5108
    GL_VERSION:    OpenGL ES 2.0 Mesa 17.0.3
=======================================================
** Failed to set swap interval. Results may be bounded above by refresh rate.
[build] use-vbo=false:Segmentation fault

Before I start investigating this problem, I would like to know if you
have already seen this issue or if you have any suggestions.

Thanks,

Fabio Estevam
