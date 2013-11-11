From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 17:11:49 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-infra: add hook to log timing of
	steps
In-Reply-To: <e7bea6b2655562e1df5e1b73a139ca6b9c9966ca.1384182040.git.yann.morin.1998@free.fr>
References: <cover.1384182040.git.yann.morin.1998@free.fr>
 <e7bea6b2655562e1df5e1b73a139ca6b9c9966ca.1384182040.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LV8E5CFGUnxNE2w5HuTMMSixLHn34iz1381dqn2nGWf=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2013 at 4:03 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The timing information is stored in the file $(O)/build-time.log
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
