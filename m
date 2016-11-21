From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:19:58 +0100
Subject: [Buildroot] [PATCH] taskd: add patch for correct gnutls
 libraries in static build
In-Reply-To: <20161120230217.13881-1-arnout@mind.be>
References: <20161120230217.13881-1-arnout@mind.be>
Message-ID: <20161121211958.22df4922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 00:02:17 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The CMakeLists.txt was using the wrong variables names to add to
> includes and libs, so the additional libraries for static build
> weren't added to the link command.
> 
> Patch sent upstream to taskwarrior-dev at googlegroups.com but it doesn't
> seem to be very active.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d01e947fa807336ffcfd0fad27397af8e7442833
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...se-correct-variables-for-GnuTLS-detection.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch

Regardless of the feedback from upstream which says it's an upstream
CMake bug, I've nonetheless applied to fix the immediate problem.

Would indeed be good if Samuel could have a look, and take this
upstream to the CMake developers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
