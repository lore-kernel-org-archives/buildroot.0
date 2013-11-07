From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 7 Nov 2013 20:35:50 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: select BR2_LEGACY for
 module-init-tools legacy option
In-Reply-To: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWoB5VznwZhChKQJHkr93A+582bJWG6gmuKw+xDPexb0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 7, 2013 at 8:09 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Commit 94c72087f3 ("module-init-tools: remove package") removed the
> module-init-tools package and therefore added the corresponding config
> option in Config.in.legacy. However, the commit forgot to add the
> "select BR2_LEGACY" that ensures the build cannot proceed until the
> user has acknowledged the change (i.e kmod replacing
> module-init-tools).
>
> This commit adds this missing "select BR2_LEGACY".
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
