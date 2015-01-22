From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Thu, 22 Jan 2015 08:12:25 +0100
Subject: [Buildroot] [PATCH 04/11 v5] package/opengl-registry: new
 package
In-Reply-To: <20150121173631.GD4375@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <a262173c20d1679301970131f119c65bc916d8be.1421699898.git.yann.morin.1998@free.fr>
 <20150120181244.7b007fc4@nserafini-N550JK>
 <20150121173631.GD4375@free.fr>
Message-ID: <20150122081225.004e5ff2@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Wed, 21 Jan 2015 18:36:31 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Nicolas, All,
> 
> On 2015-01-20 18:12 +0100, Nicolas Serafini spake thusly:
> > I have done some test using Nvidia tegra binary blob and I was not
> > able to build package that has dependency (like QT5 with OpenglES)
> > because some headers files are missing.
> > EGL/eglplatform.h
> > GLES/glplatform.h
> > GLES2/gl2platform.h
> > GLES3/gl3platform.h
> > 
> > If I add them manually it's working.
> 
> Do you mean that they are present in opengl-registry, but not
> installed? If so, I may have missed something. I'll have a look later
> tonight.

No they are not present in opengl-registry. I looked into the Makefile
if there is an option to enable the generation of these files but I saw
nothing.

I took the missing files on this page
https://www.khronos.org/registry/

> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 

Regards,
Nicolas 


-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
