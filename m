From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:57:53 +0200
Subject: [Buildroot] [PATCH 1/4] package/efl: switch to luajit support
In-Reply-To: <20160609234420.47a3588d@free-electrons.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
 <20160609234420.47a3588d@free-electrons.com>
Message-ID: <20160611155753.48833a20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 23:44:20 +0200, Thomas Petazzoni wrote:

>   CC       lib/ector/gl/lib_ector_libector_la-ector_gl_shader.lo
> In file included from ../src/lib/ector/ector_private.h:6,
>                  from lib/ector/gl/ector_renderer_gl_gradient_radial.c:9:
> ../src/lib/ector/ector_gl_internal.h:778: error: redefinition of typedef 'GLshort'
> ../src/lib/ector/gl/Ector_GL.h:16: note: previous declaration of 'GLshort' was here
> ../src/lib/ector/ector_gl_internal.h:783: error: redefinition of typedef 'GLuint'
> ../src/lib/ector/gl/Ector_GL.h:15: note: previous declaration of 'GLuint' was here
> make[5]: *** [lib/ector/gl/lib_ector_libector_la-ector_renderer_gl_gradient_radial.lo] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from ../src/lib/ector/ector_private.h:6,
>                  from lib/ector/gl/ector_renderer_gl_gradient_linear.c:9:
> ../src/lib/ector/ector_gl_internal.h:778: error: redefinition of typedef 'GLshort'
> ../src/lib/ector/gl/Ector_GL.h:16: note: previous declaration of 'GLshort' was here
> ../src/lib/ector/ector_gl_internal.h:783: error: redefinition of typedef 'GLuint'
> ../src/lib/ector/gl/Ector_GL.h:15: note: previous declaration of 'GLuint' was here
> make[5]: *** [lib/ector/gl/lib_ector_libector_la-ector_renderer_gl_gradient_linear.lo] Error 1
> [...]
> make[4]: *** [all-recursive] Error 1
> make[3]: *** [all] Error 2
> make[2]: *** [all-recursive] Error 1
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/home/test/buildroot/output/build/host-efl-1.17.0'
> make: *** [/home/test/buildroot/output/build/host-efl-1.17.0/.stamp_built] Error 2

As you requested on IRC, here is the host-efl config.log file:

  http://code.bulix.org/3yukrd-101034

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
