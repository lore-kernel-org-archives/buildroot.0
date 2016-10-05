From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Oct 2016 17:58:14 -0300
Subject: [Buildroot] [PATCH] configs/mx6udoo: Add initial support
In-Reply-To: <1475682823-28158-1-git-send-email-fabio.estevam@nxp.com>
References: <1475682823-28158-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <CAOMZO5B96HBVts-Uj7BK5KUpk5LounD3h7ik7p0VQc7kSw6zZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 5, 2016 at 12:53 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> Add the initial support for mx6q/dl udoo boards.
>
> For information about these boards, please visit:
> http://www.udoo.org/
>
> In linux.fragment we disable USB support for now because kernel 4.8
> hangs on udoo board.
>
> This is been addressed by Peter Chen's kernel patch series that provides
> a standard way to reset a USB hub.
>
> When such series hit mainline, then we can bump the kernel and remove
> linux.fragment.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Please discard this version. I need to fix an issue and will send a v2.

Thanks
