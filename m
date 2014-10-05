From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:39:48 +0200
Subject: [Buildroot] [PATCH] package-infra: comment why all checks are
 done in pkg-generic
In-Reply-To: <1412501714-1823-1-git-send-email-yann.morin.1998@free.fr>
References: <1412501714-1823-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141005133948.04aa8076@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  5 Oct 2014 11:35:14 +0200, Yann E. MORIN wrote:

>  # Ensure unified variable name conventions between all packages
> +# Some of the variables are used by more than one infrastructure; so, rather
> +# than duplicate the checks in each infrastructure, we check all variables

duplicate -> duplicating.

Applied with this fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
