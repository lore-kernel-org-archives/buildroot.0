From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:28:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: add
 BR2_PACKAGE_BOOST_NOWIDE
In-Reply-To: <20201228131353.3829106-1-fontaine.fabrice@gmail.com>
References: <20201228131353.3829106-1-fontaine.fabrice@gmail.com>
Message-ID: <20201228222832.6939011f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Dec 2020 14:13:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> nowide library has been added in version 1.73.0 and is enabled by
> default
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 5 +++++
>  package/boost/boost.mk  | 5 +++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
