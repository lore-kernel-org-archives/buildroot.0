From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:28:33 +0200
Subject: [Buildroot] [v2] fs/aci: Add App Container Image (ACI) support
 to filesystems
In-Reply-To: <57431CB2.1040601@coreos.com>
References: <57431CB2.1040601@coreos.com>
Message-ID: <20160607222833.4aa55b78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 08:07:30 -0700, Brian 'redbeard' Harrington wrote:

> +# We then create the TAR archive of all components, making sure all paths are
> +# represented correctly. Unfortunately as per fs/common.mk:8 the only a single
> +# command is allowed.

FYI, as of a few minutes ago, this limitation has been lifted, thanks
to commit
https://git.busybox.net/buildroot/commit/?id=6dd7bbb59134799ed3d7343f238b3b02592faebf
from Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
