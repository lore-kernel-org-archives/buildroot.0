From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:20:15 +0200
Subject: [Buildroot] [PATCH 14/23 v5] docs/manual: rename the generic
	dependency rules
In-Reply-To: <a6e50fc9a4cbd5827459821dff7837b3325f9eaa.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <a6e50fc9a4cbd5827459821dff7837b3325f9eaa.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLyrU=rA+OrTWsX-Dhq9QPSvZ-GQVo+xak+DMH-g3FmeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Those rules are generic, and not specific to our manual, we want them
> always called:
>   - manual-check-dependencies
>   - manual-check-dependencies-pdf
>
> So, rename them to be generic to gendoc.
>
> Cascade the document's dependency checking to call those rules, too.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
