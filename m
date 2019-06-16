From: Michael Walle <michael@walle.cc>
Date: Sun, 16 Jun 2019 14:37:53 +0200
Subject: [Buildroot] [PATCH v2] boot/uboot: add initial environment
 support
In-Reply-To: <20190527192342.23406-1-michael@walle.cc>
References: <20190527192342.23406-1-michael@walle.cc>
Message-ID: <9c7aacfe80527ce9a76d3150b431be36@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2019-05-27 21:23, schrieb Michael Walle:
> Since v2019.07 U-Boot supports extracting the compiled-in environment.
> As a first step, add support to the environment generation in 
> buildroot.
> In the future, the text file may also be copied into the target
> filesystem, where it will be used by the uboot-tools.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> 
> changes since v1:
>  - rename _INITIAL to _BUILTIN
>  - add help texts
>  - make commit message little bit more clearer, hopefully ;)
> 

ping? :)

-michael
