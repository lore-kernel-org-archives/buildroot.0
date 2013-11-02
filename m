From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Nov 2013 19:00:57 +0100
Subject: [Buildroot] [PATCH 1/2] libnl: simplify makefile by using
 --{enable, disable}-cli
In-Reply-To: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKYUDL34jkmhgbLH9mVA-s_G09gJnAaD0Vchqx_haq27Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/2 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> The libnl configure script has a --{enable,disable}-cli options that
> allows to enable or disable the compilation of the libnl tools. Use
> this option instead of compiling everything and then removing the
> installed programs.
>
> Note that we also get rid of the uninstall command, which is planned
> to be globally removed in Buildroot.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/e83f12da/attachment.html>
