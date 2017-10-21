From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 15:51:47 +0200
Subject: [Buildroot] [PATCH 03/12] docker-engine: add support for init
 processes
In-Reply-To: <20171019002257.27646-3-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-3-christian@paral.in>
Message-ID: <20171021155147.12c12362@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 20:22:48 -0400, Christian Stewart wrote:
> When a docker container is run with the --init flag, the Docker engine
> uses the docker-init binary as PID 1 inside the container. This is
> necessary in may cases to avoid issues with signal handling, zombie
> processes, and other quirks when running as PID 1.
> 
> The docker-init binary is backed by tini on default, but optionally can
> be changed to docker-init by user preference.

Did you meant "dump-init" here instead of "docker-init" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
