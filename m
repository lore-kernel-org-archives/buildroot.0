From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 12:39:04 +0200
Subject: [Buildroot] [PATCH] Document the 72 char limit on package
 description.
In-Reply-To: <1431862711-1100-1-git-send-email-julien.viarddegalbert@openwide.fr>
References: <1431862711-1100-1-git-send-email-julien.viarddegalbert@openwide.fr>
Message-ID: <20150713123904.5477fd7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear julien.viarddegalbert at openwide.fr,

On Sun, 17 May 2015 13:38:31 +0200, julien.viarddegalbert at openwide.fr
wrote:
> From: Julien Viard de Galbert <julien@vdg.name>
> 
> While describing a package I though that the tab and 2 spaces was
> already doing the margin for wrapping the help test (ie 70 char when
> wrapping to 80) but apparently the full text need to fit 72 columns.
> 
> So this patch propose to document that fact in the two places where
> the Config.in format is described.
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  docs/manual/adding-packages-directory.txt | 5 +++--
>  docs/manual/writing-rules.txt             | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
