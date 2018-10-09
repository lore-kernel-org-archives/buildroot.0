From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 21:40:26 +0200
Subject: [Buildroot] [PATCH 1/1] collectd: fix build with gpsd 3.18
In-Reply-To: <20181009171436.4333-1-fontaine.fabrice@gmail.com>
References: <20181009171436.4333-1-fontaine.fabrice@gmail.com>
Message-ID: <20181009214026.5d261155@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 19:14:36 +0200, Fabrice Fontaine wrote:
> Add patch to fix call to gps_read
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/63a4f980d7cdb4b0823840f747589803fcd0d69f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/0002-gps-fix-gps_read.patch | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/collectd/0002-gps-fix-gps_read.patch

Upstream rejected the patch, and Baruch submitted another patch that
takes into account exactly the comment made by upstream. So I've marked
this one as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
