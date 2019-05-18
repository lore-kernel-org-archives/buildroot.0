From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:21:30 +0200
Subject: [Buildroot] [PATCH v2 05/13] package/pkg-generic.mk: add
 _INSTALL_INIT_OPENRC
In-Reply-To: <20190512195550.24457-5-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-5-michal.lyszczek@bofc.pl>
Message-ID: <20190518232130.2561108b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 May 2019 21:55:42 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> * package/pkg-generic.mk
>   Add _INSTALL_INIT_OPENRC so packages can define own steps to perform
>   to install openrc service scripts.
> 
> * docs/manual/adding-packages-generic.txt
>   update documentation about new hook.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v1 -> v2
>   Suggested by Thomas Petazzoni:
>   - update "adding-packages-generic.txt" about new hook
> ---
>  docs/manual/adding-packages-generic.txt | 13 +++++++------
>  package/pkg-generic.mk                  |  2 ++
>  2 files changed, 9 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
