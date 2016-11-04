From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 4 Nov 2016 21:50:05 -0200
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <20161104212727.GB3766@free.fr>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <CAOMZO5AjUAJqMuny_xn3OHEhdvtiZwkAQB-zJcZDvFr+z=LVTA@mail.gmail.com>
 <20161104212727.GB3766@free.fr>
Message-ID: <CAOMZO5DsdPO=S1zqEpLyaiDuexxMFKNiLnw0AHdhxauOVhvisw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Nov 4, 2016 at 7:27 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> We've recently switched to using pseudo instead of fakeroot (in an
> attempt to solve #9286). But this is causing more problems.
>
> We're investigating a solution, but it's not trivial.
>
> In the meantime, you can try reverting ade91bc and 3cd88f1 (which we may
> end up doing if we can't find a solution quickly).

Are these commit IDs correct? They don't seem to exist in my tree:

git show ade91bc
fatal: ambiguous argument 'ade91bc': unknown revision or path not in
the working tree.

Thanks
