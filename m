From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 22:39:41 +0100
Subject: [Buildroot] [PATCH] package/piglit: Only support mesa and
 nvidia OpenGL provider
In-Reply-To: <011bb2fd-02a7-5876-6439-e97ad0f60c24@gmail.com>
References: <20201114144554.1795422-1-romain.naour@gmail.com>
 <20201114162518.2587e563@windsurf.home>
 <011bb2fd-02a7-5876-6439-e97ad0f60c24@gmail.com>
Message-ID: <20210123223941.7fab7556@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Nov 2020 11:24:24 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> > So perhaps we should instead have some logic that allows OpenGL and EGL
> > providers to also declare which version of the OpenGL/EGL spec they
> > provide, so that users can appropriate depend on OpenEGL and EGL
> > providers that are suitable ?  
> 
> Something like BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION ?

Yes, I'd rather work in terms of OpenGL/EGL versions or features
provided by the different OpenGL providers, rather than ad-hoc
conditions in each user of OpenGL APIs.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
