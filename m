From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Sun, 2 Feb 2014 20:40:24 +0200
Subject: [Buildroot] [PATCH 2/3] infozip: fix cross-compilation issues
In-Reply-To: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>
References: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAHaz6Gu=hK8VaLx8fBxZ6i1X533bPgU_Sp0gWzJO8LBpbRaSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Naour, all,


2014-01-31 Romain Naour <romain.naour@openwide.fr>:
(...)

> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>
(...)

> +-CFLAGS = -O2 $(CFLAGS_NOOPT)
> ++CFLAGS ?= -02 $(CFLAGS_NOOPT)
>

Excuse me, is it -02 that's meant here?


--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140202/65a1a5ab/attachment.html>
