From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:55:56 +0200
Subject: [Buildroot] [PATCH v3 2/2] classpath: Use generic check for
 host program
In-Reply-To: <1399157144-4112-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399157144-4112-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1399157144-4112-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140614195556.0044c8dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 May 2014 00:45:44 +0200, Maxime Hadjinlian wrote:
> Remove the specific check that was done in dependencies.sh to use the
> generic one that were introduced by the previous patch.
> 
> Also, introduce, BR2_NEEDS_HOST_JAVAC and BR2_NEEDS_HOST_JAR as it is
> needed by classpath.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
> Changes v2 -> v3:
>     - Fix commit log
> Changes v1 -> v2:
>     - Add the introduction of BR2_NEEDS_HOST_JAVAC & BR2_NEEDS_HOST_JAR
>       in this patch instead of the previous one.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
