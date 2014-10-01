From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 22:46:58 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/gnupg2: add readline
 optional dependency
In-Reply-To: <1411509457-8182-3-git-send-email-romain.naour@openwide.fr>
References: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
 <1411509457-8182-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141001224658.5f97c04b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 23 Sep 2014 23:57:37 +0200, Romain Naour wrote:

> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +GNUPG2_DEPENDENCIES += readline
> +endif

I've added --with-readline/--without-readline options and applied your
patch.

Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
