From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 May 2021 21:36:38 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/docker-containerd: rename
 package to containerd
In-Reply-To: <20210503031251.200043-1-christian@paral.in>
References: <20210503031251.200043-1-christian@paral.in>
Message-ID: <61901dbf-3f9d-f0c3-e027-1bb831531c06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/05/2021 05:12, Christian Stewart wrote:
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

 Applied to master, thanks. I squashed in the second patch since they really go
together. I also fixed the alphabetical ordering in package/Config.in (thank you
check-package) and I updated DEVELOPERS (thank you grep).

 Regards,
 Arnout
