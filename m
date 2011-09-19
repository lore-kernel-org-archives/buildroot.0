From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 19 Sep 2011 09:44:33 +0200
Subject: [Buildroot] [git commit] support: move patch-kernel.sh and
 rename it
In-Reply-To: <20110917063643.361CC8D728@busybox.osuosl.org>
References: <20110917063643.361CC8D728@busybox.osuosl.org>
Message-ID: <1316418273.3064.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 2011-09-17 at 08:22 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=59a326b934737483531c49c99acda7874c72e335
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The name "patch-kernel.sh" is a bit stupid, since this script is used
> to patch everything in Buildroot, not only kernel trees.

The file boot/barebox/barebox.mk still has a reference to 
toolchain/patch-kernel.sh


Regards,
Sven
