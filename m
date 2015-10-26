From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 26 Oct 2015 20:55:40 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/swupdate: add patch to
 fix build issue with some toolchains"
In-Reply-To: <1445691845-17624-1-git-send-email-bjorn.forsman@gmail.com>
References: <1445691845-17624-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1445889340.1998.0.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2015-10-24 at 15:04 +0200, Bj?rn Forsman wrote:
> This patch caused an unfortunate regression that prevents any
> handlers
> from being registered (runtime issue). This means swupdate cannot
> perform any update. Upstream has reverted it.
> 
> See discussion:
> https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ
> 
> This reverts commit a8cc6eeec5a665db5689083312beef14a9afbafa.
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---

Acked-by: J?rg Krause <joerg.krause@embedded.rocks>
