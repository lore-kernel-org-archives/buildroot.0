From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 00:27:31 +0200
Subject: [Buildroot] [PATCH] Makefile: Force make to run serially in the
 top-level Makefile
In-Reply-To: <1285710658-17096-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1285710658-17096-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <20100929002731.3e624f9d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Sep 2010 23:50:58 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> The top-level Makefile can be executed in parallel, as it causes problems.
> We can force make to be not parallel.
> 
> It's been reported many times, and recent discussions on IRC with kos_tom,
> and user nick-named knee, led to this patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
