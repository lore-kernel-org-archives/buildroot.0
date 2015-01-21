From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Jan 2015 23:40:45 +0100
Subject: [Buildroot] [PATCH 04/11 v5] package/opengl-registry: new
	package
In-Reply-To: <20150120181244.7b007fc4@nserafini-N550JK>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
 <a262173c20d1679301970131f119c65bc916d8be.1421699898.git.yann.morin.1998@free.fr>
 <20150120181244.7b007fc4@nserafini-N550JK>
Message-ID: <20150121224045.GJ4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-01-20 18:12 +0100, Nicolas Serafini spake thusly:
> I have done some test using Nvidia tegra binary blob and I was not able
> to build package that has dependency (like QT5 with OpenglES) because
> some headers files are missing.
> EGL/eglplatform.h
> GLES/glplatform.h
> GLES2/gl2platform.h
> GLES3/gl3platform.h

So, it seems they are not present in opengl-registry at all. I'll have a
look if another reistry provides them...

> If I add them manually it's working.

Where did you get those from?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
