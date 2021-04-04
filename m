From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:46:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/openmpi: drop unrecognized
 option
In-Reply-To: <20210324070413.733545-1-fontaine.fabrice@gmail.com>
References: <20210324070413.733545-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404164634.1fd5c24d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Mar 2021 08:04:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --disable-vt has been dropped since version 2.0.0 and
> https://github.com/open-mpi/ompi/commit/94190bf04b0877e878223a04c236443774e57ef2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openmpi/openmpi.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
