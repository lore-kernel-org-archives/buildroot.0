From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 16:16:09 +0100
Subject: [Buildroot] [PATCH] tremor: force ARM mode when building to
 avoid Thumb2 build problems
In-Reply-To: <1352587381-9864-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1352587381-9864-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20121115161609.4a44a363@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sat, 10 Nov 2012 23:43:01 +0100, Thomas Petazzoni wrote:
> Fixes:
> 
>   http://autobuild.buildroot.org/results/502b7d3f29d7982d56de2ae4a0b943315e04713b/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/tremor/tremor.mk |    7 +++++++
>  1 file changed, 7 insertions(+)

This one should be applied for 2012.11.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
