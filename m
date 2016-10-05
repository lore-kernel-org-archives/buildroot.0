From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Oct 2016 18:49:08 -0300
Subject: [Buildroot] [PATCH] configs/mx6udoo: Add initial support
In-Reply-To: <CAOMZO5B96HBVts-Uj7BK5KUpk5LounD3h7ik7p0VQc7kSw6zZQ@mail.gmail.com>
References: <1475682823-28158-1-git-send-email-fabio.estevam@nxp.com>
 <CAOMZO5B96HBVts-Uj7BK5KUpk5LounD3h7ik7p0VQc7kSw6zZQ@mail.gmail.com>
Message-ID: <CAOMZO5AABu-AZjVnbqteOJ78Pw_qM=iMEb+EBMU4cKNsQTCv1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 5, 2016 at 5:58 PM, Fabio Estevam <festevam@gmail.com> wrote:

> Please discard this version. I need to fix an issue and will send a v2.

It turns out this issue is not related to the udoo board.

It is commit fad58cefa4a392b ("boot/uboot: allow to build multiple
U-Boot images") that broke SPL installation.

Just sent a patch fixing it.
