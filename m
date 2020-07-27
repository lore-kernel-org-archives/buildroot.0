From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:49:03 +0200
Subject: [Buildroot] [PATCH v3 01/10] package/rustc: install cargo
 config as toolchain post-install hook
In-Reply-To: <20200207180829.165689-2-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-2-arnout@mind.be>
Message-ID: <20200727134903.40d37cbe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  7 Feb 2020 19:08:20 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> The cargo config file is much like the cmake and meson configuration
> files, something that tells the cargo build system how the
> cross-toolchain is configured. It can be used not only with our own
> host-cargo package, but also with a pre-installed cargo.

I'm not sure what you meant by a "pre-installed cargo". We certainly
don't support using a "cargo" installed on the host distribution. I've
reworded the commit log to explain a bit more clearly what we are doing
here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
