From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 22:18:11 +0100
Subject: [Buildroot] [PATCH 3/3] manual: add explanations on limitation
 about using O=...
In-Reply-To: <d384f7fdfa66bf7c3f4b0fa37465fee8a494084b.1390424303.git.yann.morin.1998@free.fr>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <d384f7fdfa66bf7c3f4b0fa37465fee8a494084b.1390424303.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+_6pSVW7VJFAaFRw1jy=mpvUfGL03V1jEGnm4JD4M3mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/22 Yann E. MORIN <yann.morin.1998@free.fr>

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Using a relative path for O=... has limitations, since it is interpreted
> relative to the Buildroot tree, and thus may lead to unexpected results.
>
> For example, running this:
>     make -C buildroot O=my-O
>
> will not vreate my-O in the current working directory, but as a
> sub-directory of the Buildroot tree, here in buildroot/my-O
>
> Explain this in the manual (as is similarly done for BR2_EXTERNAL).
> Also add a note that $(O) will be created if missing.
>
> Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140122/2e52d0ed/attachment.html>
