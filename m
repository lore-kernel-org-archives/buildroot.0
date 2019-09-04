From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:44:08 +0200
Subject: [Buildroot] [PATCH] package/snort: bump to version 2.9.14.1
In-Reply-To: <20190904005128.5720-1-sergio.prado@e-labworks.com>
References: <20190904005128.5720-1-sergio.prado@e-labworks.com>
Message-ID: <CACXmViZMDgUQMw+fWNiLbq+1QTXQgEYyhC0ughmWpmLVOz+WQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 4, 2019 at 2:52 AM Sergio Prado <sergio.prado@e-labworks.com> wrote:
>
> Since configure is using PKG_CHECK_MODULES macro, we need to
> unconditionally depends on host-pkgconf.
>
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
