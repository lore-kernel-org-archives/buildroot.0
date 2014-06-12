From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 12 Jun 2014 08:50:29 +0200
Subject: [Buildroot] [PATCH 06/12] pkg-infra: move the hg download
 helper to a script
In-Reply-To: <69fd2a38e3942f93a008c86372a0be2cfad954c4.1402260012.git.yann.morin.1998@free.fr>
References: <cover.1402260012.git.yann.morin.1998@free.fr>
 <69fd2a38e3942f93a008c86372a0be2cfad954c4.1402260012.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVcnSMM67fm62GC6BeTzfEnKk+82ZnOt0mLbST6z7MwKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 8, 2014 at 10:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Maintaining the download helpers in the Makefile has proved to be a bit
> complex, so move it to a shell script.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[tested a particular scenario that used to fail, when the 'hg archive'
step is interrupted, now working fine]
