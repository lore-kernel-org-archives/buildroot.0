From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 28 Sep 2014 11:04:34 +0200
Subject: [Buildroot] [PATCH] package: libarchive: allow building as host
	package
In-Reply-To: <20140927085443.GA4298@free.fr>
References: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
 <20140927085443.GA4298@free.fr>
Message-ID: <CAHXCMMJ5n0LARLTZkmR+xrdMM6Ui0FuDhiHdCoeP0y71DLS=ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Sat, Sep 27, 2014 at 10:54 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Guido, All,
>
> What is the rationale for building it as a host-package?
>
> libarchive provides a library, but we have no in-tree host-package that
> uses libarchive.

That's right and wrong at the same time! ;-)
There is at least 1 host package that can depend (among other things)
on libarchive: cmake.
But it seems that for this we currently rely on the host-system
libarchive or the one coming within the cmake sources.

My 2 cents. :-)


Regards,

-- 
Samuel
