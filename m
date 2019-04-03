From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:40:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/libfuse: only install udev
 rules if (e)udev is enabled
In-Reply-To: <20190402205602.1823-1-peter@korsgaard.com>
References: <20190402205602.1823-1-peter@korsgaard.com>
Message-ID: <20190403214015.3bbc13d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Apr 2019 22:56:01 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> No point in installing udev rules if nothing will use it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libfuse/libfuse.mk | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
