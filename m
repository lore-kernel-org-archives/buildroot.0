From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:47:27 +0200
Subject: [Buildroot] [PATCH v3] bandwidthd: new package
In-Reply-To: <1406784419-1479-1-git-send-email-nroach44@gmail.com>
References: <1406784419-1479-1-git-send-email-nroach44@gmail.com>
Message-ID: <20140731234727.0fb76a90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Thu, 31 Jul 2014 13:26:59 +0800, Nathaniel Roach wrote:
> ---
> Changes v2 to v3
>  - Bump version (solved issues with the db stuff)
> 
> Changes v1 to v2
> 
>  - Misc tweaks as recommended by Thomas Petazzoni
>  - Added sqlite toggle
>  - Bump version
> ---
>  package/Config.in                |  1 +
>  package/bandwidthd/Config.in     | 48 ++++++++++++++++++++++++++++++++++++++++
>  package/bandwidthd/bandwidthd.mk | 32 +++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 package/bandwidthd/Config.in
>  create mode 100644 package/bandwidthd/bandwidthd.mk

Thanks, I've applied the patch after doing some minor formatting fixes
(removing trailing whitespace, rewrapping too long help text, etc.).

Make sure to monitor http://autobuild.buildroot.org in the coming days
to see if your package appears in red. In which case, you're invited to
investigate the build failures caused by your new package, and provide
patches to fix them! :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
