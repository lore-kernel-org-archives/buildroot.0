From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 May 2020 19:29:55 -0500
Subject: [Buildroot] [PATCH 2/3 v2] package/kmod: add option for host
 variant
In-Reply-To: <8975bac482a23ce136b832dfa569b37335dcefe8.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
 <8975bac482a23ce136b832dfa569b37335dcefe8.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpYOyZ__wMQiK7ZKyOeE0Tuy3t+2uc1J8=3M3DYU3jB8Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Sun, May 3, 2020 at 8:14 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Curently, host-kmod has no option to enable it, because only
> the kernel depends on it, and this is unconditional (because
> we can't know if modules will be enabled in the kernel config).
>
> But we're soon to add options to enable various features of
> kmod, so we'll need a place where to show those features.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Lucian Buga <lucianbuga@gmail.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
