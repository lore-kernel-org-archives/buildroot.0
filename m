From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:20:21 +0200
Subject: [Buildroot] [PATCH 15/23 v5] docs/manual: allow documents to
 define some hooks, as for a package
In-Reply-To: <23bf1e5cf8d3e8664077e5e85657193f1a363181.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <23bf1e5cf8d3e8664077e5e85657193f1a363181.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+Q_+m5aUvLB2-en_anAobtq6wSFV8W02jgMPXuNL+=Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Allow documents to define two hooks:
>   - DOC_EXTRA_CHECK_DEPENDENCIES
>     to check for extra dependencies required by this document
>   - DOC_EXTRA_CHECK_DEPENDENCIES_FMT
>     ditto, but for the specific format
>   - DOC_POST_EXTRACT_HOOKS:
>     to run additional actions to fill-in the build directory
>
> (Replace 'DOC' with the uppercase name of the document, and 'FMT' with
> the format.)
>
> This is supposed to replace the current use of overloading the internal
> dependency rules, and makes GENDOC behave yet a bit more like the
> package infrastructure.
>
> Note that GENDOC_INNER already has the uppercase name as an argument,
> whereas GENDOC does not, so the two foreach loops are not exactly
> similar (for now.)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
