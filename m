From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 10:21:29 +0000
Subject: [Buildroot] [PATCH v3 1/2] zbar: new package
In-Reply-To: <1446100633-23719-1-git-send-email-sv99@inbox.ru>
References: <1446100633-23719-1-git-send-email-sv99@inbox.ru>
Message-ID: <5631F329.6060105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

sorry, one more comment on this.

On 10/29/2015 06:37 AM, Viacheslav Volkov wrote:
> +ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
> +ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))

There are released tarballs that can be downloaded from the official
ZBar website. Why don't you use them instead of GitHub? We normally
prefer released tarballs unless there is a good reason to not do it.

In case there is such a good reason to not use the released tarball, why
do you use the GitHub mirror? It looks like the official ZBar repository
is the Mercurial one:

http://sourceforge.net/p/zbar/code/ci/default/tree/

I don't know the opinion of other developers, but I would prefer to use
the official repository instead of a mirror when possible. So, my order
of preference would be:

1st - released tarballs
2nd - official repository
3rd - mirror

Regards,

Vincent.
