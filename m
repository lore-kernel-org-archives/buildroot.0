From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2016 16:05:18 -0300
Subject: [Buildroot] [PATCH 2/8] package/glmark2: gl support also
 depends on X.org
In-Reply-To: <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <57210D6E.4010408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/04/16 09:20, Bernd Kuhls wrote:

> https://git.busybox.net/buildroot/commit/package/mesa3d?id=f1894ec95728806e09405d26663e0ea371afaeab
> removed the dependency on X.org for DRI drivers, this patch uses the
> new mesa3d option BR2_PACKAGE_MESA3D_OPENGL_GL to determine OpenGL
> support.
>
> Fixes
> http://autobuild.buildroot.net/results/461/46146a63f83e318f1213ec1d558558e3404d8ff8/
> http://autobuild.buildroot.net/results/c91/c91f6bce6f8a0691467a5ca16d5fe15687ee945c/
> http://autobuild.buildroot.net/results/ac5/ac560e36977f90cf93098c987d401d64edce24cb/
> http://autobuild.buildroot.net/results/c71/c712af468012b1e23e3048207611f0da78fb1ae0/
> http://autobuild.buildroot.net/results/b82/b8251a40f5eb5e1124e1a6e1abe407db83c75371/
> http://autobuild.buildroot.net/results/667/667b7847e47b1d272d028da4a18d77e70ab01875/
> http://autobuild.buildroot.net/results/6a4/6a45e32c0f894508d05c964a9a0fd645b6f3d6e4/
> http://autobuild.buildroot.net/results/d96/d960bcfff386310e265d0d40533ef2ef7f74d5fe/
> http://autobuild.buildroot.net/results/7bd/7bd41a86d60543d3de4483f86f0b5a719cf480b9/
> and others
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(pending patch 1 from the series getting applied, and making my glmark2 
autobuild fix completely irrelevant)
