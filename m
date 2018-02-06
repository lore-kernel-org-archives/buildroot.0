From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 16:32:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/ncurses: Add option to install
 extra terminfo files.
In-Reply-To: <20171016011351.15816-1-camh@xdna.net>
References: <20171016011351.15816-1-camh@xdna.net>
Message-ID: <20180206163226.78d899ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Oct 2017 12:13:51 +1100, Cam Hutchison wrote:
> Add an option to ncurses to install extra user-configured terminfo
> files. By default, only a small number of vital terminfo files are
> installed on the target. This allows a build to specify the terminfo
> files it needs.
> 
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  package/ncurses/Config.in  | 10 ++++++++++
>  package/ncurses/ncurses.mk |  3 ++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

As you noted, I've changed the code to use qstrip, and then applied to
next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
