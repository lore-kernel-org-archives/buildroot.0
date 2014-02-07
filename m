From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Feb 2014 21:50:56 +0100
Subject: [Buildroot] [pkg-perl infra V5 8/8] cpanminus: remove it
In-Reply-To: <1391763337-30660-9-git-send-email-francois.perrad@gadz.org>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
 <1391763337-30660-9-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LXwZXeYiHrUyoG6Nuga2fi4P-Rsy+0mph-PtKbcB=v_fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Fri, Feb 7, 2014 at 9:55 AM, Francois Perrad <fperrad@gmail.com> wrote:
> cpanminus was marked as broken, now it becomes useless with the Perl infrastructure.
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |    1 -
>  package/cpanminus/Config.in    |   40 ----------------------------------
>  package/cpanminus/cpanminus.mk |   47 ----------------------------------------
>  3 files changed, 88 deletions(-)
>  delete mode 100644 package/cpanminus/Config.in
>  delete mode 100644 package/cpanminus/cpanminus.mk
>

Shouldn't we add an entry in Config.in.legacy for the removed symbol?

Best regards,
Thomas
