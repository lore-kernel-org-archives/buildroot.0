From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 29 Apr 2019 16:38:41 -0700
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
 <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
Message-ID: <CAMo8BfK_oNzVTDawQvJakCozYsF6ThxCNzDx0ez75J9wN8cHxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 29, 2019 at 3:32 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> > +  elif [ $device_name == "xtensa-lx60" ] || [ $device_name == "xtensa-lx60-nommu" ]; then
> > +    echo "xtensa cannot be tested"
>
>  If that is the case, why do we even have these qemu defconfigs? Max?

Tested both configurations just now, with the current buildroot tip
(2019.02-959-gd54b0e22aef3) and QEMU-4.0. Both build and boot for me
with QEMU command line from the readme.
Curious as well.

-- 
Thanks.
-- Max
