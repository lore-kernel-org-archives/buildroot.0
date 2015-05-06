From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 23:55:37 +0200
Subject: [Buildroot] [PATCH 1/1] dieharder: new package
In-Reply-To: <1430947801-4156-1-git-send-email-julien.viarddegalbert@openwide.fr>
References: <1430947801-4156-1-git-send-email-julien.viarddegalbert@openwide.fr>
Message-ID: <20150506235537.1c6c09ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 May 2015 23:30:01 +0200, julien.viarddegalbert at openwide.fr
wrote:

> +# fix endiannes detection
> +ifeq ($(BR2_ENDIAN),"BIG")
> +BR2_AC_CV_C_ENDIAN = ac_cv_c_endian=bin

"big" probably.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
