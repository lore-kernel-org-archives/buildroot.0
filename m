From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 15 Jun 2014 21:38:33 +0200
Subject: [Buildroot] [PATCH 03/20 RFC] support/gen-manual-lists.py: bail
 out early for legacy symbols
In-Reply-To: <97051d5faa0925f0906a9566961fcc3a396c4b73.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
 <97051d5faa0925f0906a9566961fcc3a396c4b73.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+VQ6aSnCWmOqbzgKDjV+2=QVeiDHdZ21pZabvfrsDOfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Jun 14, 2014 at 1:02 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> When searching for virtual package providers, there's no need to
> handle legacy symbols at all, so just bail out early.

Do forget your SoB line ;-) and you can add my ack too :)

Acked-by: Samuel Martin <s.martin49@gmail.com>
