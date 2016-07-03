From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 11:21:26 +0200
Subject: [Buildroot] [PATCH 3/3] package/sunxi-mali: remove useless
	package
In-Reply-To: <c7293830796ec228f541077aa09df81dda34d8af.1467534694.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 3 Jul 2016 10:33:11 +0200")
References: <cover.1467534694.git.yann.morin.1998@free.fr>
 <c7293830796ec228f541077aa09df81dda34d8af.1467534694.git.yann.morin.1998@free.fr>
Message-ID: <8737nr13hl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > sunxi-mali-prop only served a feeding prey for sunxi-mali to get the
 > proprietary libs.

 > Now that sunxi-mali downloads them (as the git submodule they are), we
 > no longer need sunxi-mali-prop.

 > Remove it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
