From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 14:35:04 +0100
Subject: [Buildroot] [PATCH next 3/4] lttng-babeltrace: bump version to
 1.5.0
In-Reply-To: <20161130170445.55222-3-Vincent.Riera@imgtec.com>
References: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
 <20161130170445.55222-3-Vincent.Riera@imgtec.com>
Message-ID: <20161203143504.5a31e6ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 17:04:44 +0000, Vicente Olivert Riera wrote:
> Drop sha256 hash. The combination of md5 and sha1 hashes is enough.
> 
> Release notes:
>   https://lists.lttng.org/pipermail/lttng-dev/2016-November/026762.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/lttng-babeltrace/lttng-babeltrace.hash | 9 +++------
>  package/lttng-babeltrace/lttng-babeltrace.mk   | 2 +-
>  2 files changed, 4 insertions(+), 7 deletions(-)

This was apparently not tested at all: one of the patches fails to
apply, see
http://autobuild.buildroot.net/results/98a/98a42516fa7e2c79e5529d1b5a8d44fcd60934c7/build-end.log.

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
