From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 20:22:17 +0100
Subject: [Buildroot] [PATCH 1/4] libglib2: bumped version to 2.32.4
In-Reply-To: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
Message-ID: <20121219202217.34f0959f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear bogdan at nimblex.org,

On Wed, 19 Dec 2012 16:58:41 +0000, bogdan at nimblex.org wrote:
> From: Sven Neumann <s.neumann@raumfeld.com>
> 
> Bump libglib2 to a newer stable version.
> 
> There are a few changes to the configure options necessary
> in order to make it compile cleanly and work correctly.
> The patch has been tested on ARM and i486. Some things
> might have to be adjusted for other platforms.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
>  ...b2-make-codegen-python2-python3-compliant.patch | 192 ---------------------

Could you justify why this patch is no longer needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
