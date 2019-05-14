From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:24:43 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: add cmocka
 dependency
In-Reply-To: <20190510222029.28734-1-fontaine.fabrice@gmail.com>
References: <20190510222029.28734-1-fontaine.fabrice@gmail.com>
Message-ID: <20190514192443.7b3110b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 May 2019 00:20:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use system version of cmocka instead of the embedded one
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/samba4/Config.in | 3 ++-
>  package/samba4/samba4.mk | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
