From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 3 May 2021 09:06:11 -0500
Subject: [Buildroot] [PATCH v1 2/2] package/docker-engine:
 docker-containerd was renamed to containerd
In-Reply-To: <20210503031251.200043-2-christian@paral.in>
References: <20210503031251.200043-1-christian@paral.in>
 <20210503031251.200043-2-christian@paral.in>
Message-ID: <CANQCQpaiT5NxcMvYNP1Ej5JBcWwc4kxs8BvLmD4mS+P5-72y0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Sun, May 2, 2021 at 10:14 PM Christian Stewart <christian@paral.in> wrote:
>
> Signed-off-by: Christian Stewart <christian@paral.in>

I think this is a good transition to drop Docker from the package
name.  Especially with the community push to separate the runtimes
from other tools/features Docker traditionally packages together.
(Good example of when the naming change makes things clearer is when a
user solely needs the Containerd runtime (maybe an edge Kubernetes use
case).  Selecting something tagged with "Docker" could be confusing.)

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
