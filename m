From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 30 Apr 2019 08:40:44 -0700
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
 <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
 <CAHpTZwnYegw7DTpoke0Yqf-DghTnAoL8+zN2bhQjVCasfHuoUA@mail.gmail.com>
 <4368e67d-3b86-9566-2fac-28c247dce4b6@mind.be>
Message-ID: <CAMo8BfJSPLSuVwosh4W39Uw8JMBmsQbBUmHTD7K3K71=QKFv-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 30, 2019 at 4:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >     >  If that is the case, why do we even have these qemu defconfigs? Max?
> >
> >     Tested both configurations just now, with the current buildroot tip
> >     (2019.02-959-gd54b0e22aef3) and QEMU-4.0. Both build and boot for me
> >     with QEMU command line from the readme.
>
>  Is this with the system-intalled qemu? I guess so, because Buildroot still has
> 3.1.0... That might be the issue :-)

Just tested with that version of QEMU... Both work as expected here.
Still puzzled (:

-- 
Thanks.
-- Max
