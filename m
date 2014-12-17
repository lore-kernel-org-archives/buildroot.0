From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 22:31:31 +0100
Subject: [Buildroot] [PATCH v3] package/gdb: fix shared-only build
In-Reply-To: <1418851810-6586-1-git-send-email-romain.naour@openwide.fr>
References: <1418851810-6586-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141217223131.01f10be4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 17 Dec 2014 22:30:10 +0100, Romain Naour wrote:

> +# The shared only build is not supported by gdb, so enable static build for
> +# buildin libraries whith --enable-static.

buildin -> built-in

whith -> with

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
