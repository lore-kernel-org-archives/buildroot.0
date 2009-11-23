From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Nov 2009 13:35:08 +0100
Subject: [Buildroot] help crosscompile
In-Reply-To: <20091123122221.119370@gmx.net>
References: <20091123122221.119370@gmx.net>
Message-ID: <20091123123508.GK14091@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 23, 2009 at 01:22:21PM +0100, Jens Kleinhans wrote:
> I want to crosscompile kernel with the following command:
> 
> make ARCH=arm  CROSS_COMPILE=<path_to_cross-compiler/cross-compiler-prefix->
> 
> I build up my buildroot follwing the guide of http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild.
> 
> What must I replace for "<path_to_cross-compiler/cross-compiler-prefix->".
> What is the cross-compiler-prefix?

/path/to/your/buildroot/build_arm/staging_dir/usr/bin/arm-linux-

should work.

Daniel
