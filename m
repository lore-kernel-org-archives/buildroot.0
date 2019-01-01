From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 1 Jan 2019 20:57:33 +0100
Subject: [Buildroot] [PATCH v3 3/3] package/piglit: new package
In-Reply-To: <20180922105626.22626-3-romain.naour@gmail.com>
References: <20180922105626.22626-1-romain.naour@gmail.com>
 <20180922105626.22626-3-romain.naour@gmail.com>
Message-ID: <58ac45e3-24c6-5655-8ffd-ed2d110d18c8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Ping.

The first version of this patch was sent one year ago:
http://patchwork.ozlabs.org/patch/852832/

If someone can take a look, it would be great.

Best regards,
Romain

Le 22/09/2018 ? 12:56, Romain Naour a ?crit?:
> Piglit is an open-source test suite for OpenGL implementations.
> It's an python3 script based around several tools like glxinfo,
> wflinfo, dmesg.
> 
> Even though waffle support can be replaced by freeglut,
> using pliglit with waffle is recommended since freeglut
> will be replaced by waffle.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v3: bump version, rebase after the switch to xorgproto
>     add a dependency on waffle package
>     reorder packages in Config.in
>     I'm not sure if we can avoid host-python-{mako,numpy,six} dependency
>     because the build system is checking with host-python.
>     Yocto packaging use the same workaround.
>     https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-graphics/piglit/piglit_git.bb
> v2: bump version
> ---
