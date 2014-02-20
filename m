From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 20 Feb 2014 15:40:06 +0100
Subject: [Buildroot] [PATCH] Makefile: fix target-finalize rule
In-Reply-To: <1392906378-30112-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392906378-30112-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAAXf6LVDZB6foNQPjn7xWJu0jC0A2Us2tqW+B=HEpzaocwPzhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 20, 2014 at 3:26 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Fix a bug introduced by the commit a24877586a566e052897e50e6a0c2f53cfb029f5
> (Makefile: add support for top-level parallel make).
>
> That commit put a new rule inside the target-finalize rule so it was
> erroneously splitted in two parts.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
