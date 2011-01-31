From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 31 Jan 2011 23:30:06 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: accept upper case
 $(PKG)_SITE_METHOD as well
In-Reply-To: <1296510767-15670-1-git-send-email-bjorn.forsman@gmail.com>
References: <1296510767-15670-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTikMeVCgHZs8z-tx+X5uTT=RSdunZfmSSYTj4uc7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/1/31 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> The Buildroot documentation says it's OK to use upper case names for
> $(PKG)_SITE_METHOD, but the implementation does not support it. This
> patch adds support for both upper and lower case names.

In my opinion changing the documentation is a better way to go since
it would make the mk files uniformed.
