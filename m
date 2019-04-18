From: Philip Molloy <philip@philipmolloy.com>
Date: Thu, 18 Apr 2019 20:00:53 +0000
Subject: [Buildroot] [PATCH v2 1/1] board: rename pine64 to pine64_a64
In-Reply-To: <CAMty3ZCcVctFZnJfn8A1B1yjR=jgEyniq7nk04P9OpuitByq=w@mail.gmail.com>
References: <lNEO_Exlu8W8Rjcd0oJ5vQ2ptr6KvnyYieAxGJuwAPSSa4Go3VPYfrZObxeECm6eCv1iWrGk1aaI8GXfqh1qEMvKZ5Nm_H0Ul49slqofIKA=@philipmolloy.com>
 <be5ea5a8-7393-7293-200d-cc5f1fc7e365@mind.be>
 <CAMty3ZCcVctFZnJfn8A1B1yjR=jgEyniq7nk04P9OpuitByq=w@mail.gmail.com>
Message-ID: <8Su5ReOBt0O1vExwDu1Qw1RWpgOZH-bzXl7JJjL931JUpCs25t8Uw-MzRZHijMFDtG6mUbLrrL-0HCRgXrVuPNvXhZp6owmIkd1l6DYr530=@philipmolloy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, April 15, 2019 5:49 AM, Jagan Teki <jagan@amarulasolutions.com> wrote:

> > Or we say that the a64 is a bit redundant, and we call them
> > pine64_pine_defconfig and board/pine64/pine
> > pine64_rock64_defconfig and board/pine64/rock64
> > pine64_sopine_defconfig and board/pine64/sopine
>
> This is what I'm recommended in another mail. The board name is PINE
> and it is A64 based same like SOPINE with A64 based.

My main motivation was simply to replace the vendor name. I personally think that abbreviating the name just adds confusion since the abbreviated name is not very distinct from the vendor name. It also does not reflect common usage. Googling for "Pine64 Pine" returns results for "PINE64 PINE A64". I did find one blog post where someone referred to it as a "Pine A64 or Pine64"!

As far as Sopine is concerned. It seems like the "Sopine A64" is a module that connects to the "Sopine" baseboard. So like the names used for the corresponding U-Boot defconfig and Linux DTS it should probably be something like "sopine_a64_baseboard". Renaming it to "sopine_a64" makes it sound like it is a config just for the module.

I think we can all agree that PINE64's naming leaves a lot to be desired. I won't submit another patch, but I appreciate the review and thanks for the consideration.

Best,
Philip
