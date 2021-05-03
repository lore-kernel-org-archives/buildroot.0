From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 3 May 2021 08:49:27 -0500
Subject: [Buildroot] [PATCH v1 1/2] package/docker-containerd: rename
 package to containerd
In-Reply-To: <20210503031251.200043-1-christian@paral.in>
References: <20210503031251.200043-1-christian@paral.in>
Message-ID: <CANQCQpZyRHZE6fyH-2ZnbEjNrcHhPDiLAi16VkW3Rc83h+uSDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,


On Sun, May 2, 2021 at 10:13 PM Christian Stewart <christian@paral.in> wrote:
>
> containerd is now an independent project from Docker.
>
> This commit renames the Buildroot package from docker-containerd to containerd,
> adding a entry in Config.in.legacy accordingly.
>
> containerd is an industry-standard container runtime with an emphasis on
> simplicity, robustness and portability. It is available as a daemon for Linux
> and Windows, which can manage the complete container lifecycle of its host
> system: image transfer and storage, container execution and supervision,
> low-level storage and network attachments, etc.
>
> https://containerd.io
>
> Signed-off-by: Christian Stewart <christian@paral.in>

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
