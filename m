From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 01 Mar 2014 20:27:40 +0100
Subject: [Buildroot] [PATCH 0/17 v2] Add new virtual-package
	infrastructure
In-Reply-To: <cover.1393695127.git.yann.morin.1998@free.fr>
References: <cover.1393695127.git.yann.morin.1998@free.fr>
Message-ID: <e5846500-86ec-4092-a36d-afec302bf5c9@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>Hello All!
>
>Here is a quick series implementing a new infrastructure for virtual
>packages.
>
>Basically, all a virtual package has to do in its .mk is:
>
>    $(eval $(virtual-package))
>
>There is no need to:
>  - define the dependency against the provider,
>  - define _SOURCE=""  (empty)
>


The toolchain package is also a virtual package. I haven't checked the details, but could it also benefit from this infra?

Best regards,
Thomas
