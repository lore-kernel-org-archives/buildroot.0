From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:56:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: force Release mode
In-Reply-To: <20200516121935.1235445-1-fontaine.fabrice@gmail.com>
References: <20200516121935.1235445-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017145658.45f593d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 May 2020 14:19:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# Force Release to fix build failure without SSP
> +PISTACHE_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release

In some packages, we use CMAKE_BUILD_TYPE=Buildroot, and in others
CMAKE_BUILD_TYPE=Release. Should we take a decision on which one makes
the most sense ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
