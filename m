From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Sep 2012 13:05:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] Download packages from github in
 tar.gz format instead git format.
In-Reply-To: <1347746247-12033-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347746247-12033-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <CAHXCMM+r-m6dGDBeOoV6=5vdYt846Y16h2-Mnu3Z8TZbDj1YjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/15 Marek Belisko <marek.belisko@open-nandra.com>:
> Verified way how to get packages from github by version or sha1
> (it's enough to use first 7 characters from SHA1):
> 1. by sha1
> FOO_VERSION = 1234567
> FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
> FOO_SITE = http://github.com/user/package/tarball/master
>
> 2. by version
> FOO_VERSION = v1.0
> FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
> FOO_SITE = http://github.com/user/package/tarball/$(FOO_VERSION)
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
