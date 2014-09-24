From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 24 Sep 2014 21:18:14 +0200
Subject: [Buildroot] [PATCH 16/23 v5] docs/manual: use the new hooks
	instead of gendoc rules
In-Reply-To: <9de7780fd9957d06652310686379ef9880578be8.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <9de7780fd9957d06652310686379ef9880578be8.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LWsJ+0ruwg5SxhLTLPO3DX4g3SJEbqGPK3FrRJWF_1z6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Also reorder a bit the definition of the variables, to more ressemble

resemble

> a package. Yet a bit more...
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

This patch looks fine to me, aside from the comments I gave in earlier patches:
- s/ressources/resources
- suggestion to use POST_RSYNC iso POST_EXTRACT
- suggestion to remove EXTRA_

Best regards,
Thomas
