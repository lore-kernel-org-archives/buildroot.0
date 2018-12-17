From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 09:08:10 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-12-16
In-Reply-To: <875zvs4lwp.fsf@dell.be.48ers.dk>
References: <20181217070031.7A1922072F@mail.bootlin.com>
 <875zvs4lwp.fsf@dell.be.48ers.dk>
Message-ID: <20181217090810.18bfe9d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Dec 2018 09:06:46 +0100, Peter Korsgaard wrote:

>  >      aarch64 |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe |     
>  >          arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7 |       
> 
> /bin/sh: /home/naourr/work/instance-0/output/host/bin/aarch64-linux-gnu-cc: No such file or directory
> 
> swupdate uses $CROSS-cc and not $CROSS-gcc, which not all external
> toolchain have. I think it makes sense to add a cc -> gcc symlink for
> external toolchains we download if not present. We cannot really do it
> for pre-installed external toolchains as we might not have write access
> to them.

Does it make sense for swupdate to use -cc instead of -gcc ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
