From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:24:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: introduce static
 cli toggle
In-Reply-To: <20170319062042.6106-1-christian@paral.in>
References: <20170319062042.6106-1-christian@paral.in>
Message-ID: <20170319212423.40a54ea7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 02:20:42 -0400, Christian Stewart wrote:
> Adds an option to compile the docker CLI statically.
> 
> This is useful when bind-mounting the docker client binary into
> containers for a docker-in-docker setup.
> 
> The Docker CLI communicates with the daemon over a socket. It is
> sometimes useful to bind-mount the Docker CLI and socket into containers at
> run-time, so that scripts within the containers can call the Docker API
> in the host using a client compatible with the host daemon.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/Config.in        | 6 ++++++
>  package/docker-engine/docker-engine.mk | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
