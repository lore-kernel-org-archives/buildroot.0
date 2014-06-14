From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:54:53 +0200
Subject: [Buildroot] [PATCH v3 1/2] infra: Add generic check_prog_host
 function
In-Reply-To: <1399157144-4112-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399157144-4112-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140614195453.585cd58f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 May 2014 00:45:43 +0200, Maxime Hadjinlian wrote:
> Avoid copy/pasting the same block of code to check if a program is
> available on the host machine.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v2 -> v3:
>     - None
> Changes v1 -> v2:
>     - Remove the introduction of BR2_NEEDS_HOST_JAVAC &
>       BR2_NEEDS_HOST_JAR to add them in the classpath patch. (Thomas De
>       Schampheleire)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
