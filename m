From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 21:56:31 +0200
Subject: [Buildroot] [PATCH 08/23 v5] docs/manual: manual-update-lists
 is not a generic GENDOC rule
In-Reply-To: <d64c6de38efa0d677787438bd0c9f94fdae2ae1d.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <d64c6de38efa0d677787438bd0c9f94fdae2ae1d.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+4XpSy4=Qc4-Ex30yDx=31g-Y5qLiidpZazCnNXDn-AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Move the manual-update-lists .PHONY declaration out of GENDOC, since not
> all the documents may have an -update-lists rule.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
