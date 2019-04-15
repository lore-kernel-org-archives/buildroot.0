From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 15 Apr 2019 15:19:15 +0530
Subject: [Buildroot] [PATCH v2 1/1] board: rename pine64 to pine64_a64
In-Reply-To: <be5ea5a8-7393-7293-200d-cc5f1fc7e365@mind.be>
References: <lNEO_Exlu8W8Rjcd0oJ5vQ2ptr6KvnyYieAxGJuwAPSSa4Go3VPYfrZObxeECm6eCv1iWrGk1aaI8GXfqh1qEMvKZ5Nm_H0Ul49slqofIKA=@philipmolloy.com>
 <be5ea5a8-7393-7293-200d-cc5f1fc7e365@mind.be>
Message-ID: <CAMty3ZCcVctFZnJfn8A1B1yjR=jgEyniq7nk04P9OpuitByq=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 14, 2019 at 3:19 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Philip, Jagan,
>
>  Let's sort out this confusion...
>
> On 30/03/2019 22:27, Philip Molloy wrote:
> > The link to https://www.pine64.org/?page_id=1194 in
> > board/pine64/pine64/readme.txt loads a page for the "PINE A64" board.
> > Follow the convention of using the model name to identify the board.
>
>  One thing is clear: the vendor is pine64. The names of the boards, however,
> don't seem so clear...
>
>  If I look at the pine64.org website, I see on the front page (at the moment)
> three boards advertised, and they are named PINE A64-LTS, ROCK64, and SOPINE A64.
>
>  So I think we have two options. Either we keep the A64 bit, and the three
> current boards should be named:
>
> pine64_pine_a64_defconfig and board/pine64/pine_a64
> pine64_rock64_defconfig and board/pine64/rock64
> pine64_sopine_a64_defconfig and board/pine64/sopine_a64
>
>  Or we say that the a64 is a bit redundant, and we call them
>
> pine64_pine_defconfig and board/pine64/pine
> pine64_rock64_defconfig and board/pine64/rock64
> pine64_sopine_defconfig and board/pine64/sopine

This is what I'm recommended in another mail. The board name is PINE
and it is A64 based same like SOPINE with A64 based.
