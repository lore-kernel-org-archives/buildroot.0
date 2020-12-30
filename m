From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:57:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: add s390x support
In-Reply-To: <20201213221642.810475-1-fontaine.fabrice@gmail.com>
References: <20201213221642.810475-1-fontaine.fabrice@gmail.com>
Message-ID: <20201230235718.0555cb5f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Dec 2020 23:16:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> s390x is supported since version 1.14
> http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=8338a4ba93367974758dc5e195f67e9d171d4086
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgpg-error/Config.in | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
