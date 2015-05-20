From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 20 May 2015 13:13:27 +0200
Subject: [Buildroot] [PATCH] Handle defconfig as .config in .gitignore
	and distclean.
In-Reply-To: <530190200.250863.1432112666116.JavaMail.root@openwide.fr>
References: <555c49ac.0a64b40a.3499.ffffb3f0@mx.google.com>
 <530190200.250863.1432112666116.JavaMail.root@openwide.fr>
Message-ID: <CABbD_XAgJWoQ5R6-01Enp37CP18i6fNgj6oCRB7uxvrkY4TmRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

Thanks for reviewing!

people are told to work with a clone of buildroot and adding defconfig
>  to gitignore means that ther is a high chance of not adding it to git
> and loosing it...
>

You are right in this context, but .config is also in .gitignore, which
also shouldn't be there if a custom repo is used.
I think .gitignore should be tuned to the git repo currently used -
buildroot's own repo in the vanilla BR case.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150520/a35097b0/attachment.html>
