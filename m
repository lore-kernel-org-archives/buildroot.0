From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:37:29 +0200
Subject: [Buildroot] [PATCH] package/postgresql: fix pthread flags
 detection
In-Reply-To: <1427131410-5670-1-git-send-email-jcmvbkbc@gmail.com>
References: <1427131410-5670-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150506213729.7a98b363@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Mon, 23 Mar 2015 20:23:30 +0300, Max Filippov wrote:
> PostgreSQL configure may not correctly determine flags for compiling and
> linking with pthreads support when compiler or linker give irrelevant
> warnings.
> 
> Record default compiler and linker output and see if adding pthread
> option changes that, instead of assuming that linker and compiler are
> silent by default.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/916487aae929c181d4e3f471c6c7508552f0b683/
>   http://autobuild.buildroot.net/results/921a94d1a489d81b362c5b6a403a156b4691effd/
>   http://autobuild.buildroot.net/results/dbcdc58ad32b7b811ea47b6fc0f926a477e30786/
>   http://autobuild.buildroot.net/results/68b582f4caec223a646f095487263353f273156d/
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Upstream status: patch submitted.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
