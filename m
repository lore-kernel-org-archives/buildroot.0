From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 24 Oct 2015 14:01:14 +0200
Subject: [Buildroot] [git commit] package/swupdate: add patch to fix
 build issue with some toolchains
In-Reply-To: <20151019210337.3699681DEC@busybox.osuosl.org>
References: <20151019210337.3699681DEC@busybox.osuosl.org>
Message-ID: <CAEYzJUGe08AuhCFO4mdOywLQU2Wju=ZaEiFRbwmzGMdmAaNJ5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch caused an unfortunate regression that prevents any handlers
from being registered (runtime issue).
This means it cannot perform any update. Upstream has reverted it.

See discussion:
https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ

- Bj?rn
