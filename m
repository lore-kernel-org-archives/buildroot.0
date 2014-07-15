From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:28:14 +0200
Subject: [Buildroot] [PATCH 1/2] apply-patches.sh: don't print anything
 when "-s" option is used
In-Reply-To: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140715212814.1dfcce43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed,  9 Jul 2014 13:46:53 +0200, Fabio Porcedda wrote:
> The make "-s" option is used to enable the "Silent operation" so if
> that option is used don't print anything as far as there isn't any
> error.
> Add the "-s" option to "apply-patches.sh" to enable silent operation.
> Because "apply-patches.sh" is called in many places add a
> "APPLY_PATCHES" variable to permit adding the "-s" easily.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Hum, yes, but why? The entire build process is anyway very noisy, so is
there really a point in silencing specifically this part? What is the
ultimate goal you're trying to achieve here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
