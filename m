From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:49:36 +0200
Subject: [Buildroot] [PATCH v3 02/10] package/rust: build and install
 cargo
In-Reply-To: <20200207180829.165689-3-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-3-arnout@mind.be>
Message-ID: <20200727134936.65c5f6a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  7 Feb 2020 19:08:21 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> 
> Cargo source code is not provided anymore as a separate tarball but is
> now built along with the Rust compiler.
> 
> So update rust host variant to build Cargo and install the
> cross-compilation configuration file.

I've reworded when applying, since this commit no longer messes up with
the cross-compilation configuration file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
