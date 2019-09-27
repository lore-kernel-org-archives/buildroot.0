From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:33:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.71.0
In-Reply-To: <20190923191514.10484-1-fontaine.fabrice@gmail.com>
References: <20190923191514.10484-1-fontaine.fabrice@gmail.com>
Message-ID: <20190927233304.75b440f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 21:15:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Change BOOST_SITE to
>   https://dl.bintray.com/boostorg/release/1.71.0/source to get latest
>   boost version
> - Update path of bjam
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.hash | 4 ++--
>  package/boost/boost.mk   | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks. Let's how much this explodes in the
autobuilders. Boost version bumps usually cause quite a bit of breakage
in other packages :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
