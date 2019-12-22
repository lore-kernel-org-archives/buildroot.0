From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:21:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/fluidsynth: new package
In-Reply-To: <20191209200324.11065-1-juju@cotds.org>
References: <20191205203336.27806-1-juju@cotds.org>
 <20191209200324.11065-1-juju@cotds.org>
Message-ID: <20191222232104.25e40ea0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Dec 2019 21:03:24 +0100
Julien Olivain <juju@cotds.org> wrote:

> FluidSynth is a real-time software synthesizer based on the
> SoundFont 2 specifications and has reached widespread
> distribution. FluidSynth itself does not have a graphical
> user interface, but due to its powerful API several
> applications utilize it and it has even found its way onto
> embedded systems and is used in some mobile apps.
> 
> http://www.fluidsynth.org/
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
> Changes v1 -> v2:
> Included all Gilles' comments:
>   - Add comments for dependencies
>   - Clarified "float" option
>   - Removed useless "thread" option
>   - Add LICENSE file hash
>   - Removed "v" in VERSION
>   - Fixed LICENSE to LGPL-2.1+

I've done a number of improvements to the Config.in file in terms of
dependencies, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
