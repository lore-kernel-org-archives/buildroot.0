From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:22:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/fastd: libcap is optional not
 mandatory
In-Reply-To: <20201031210707.960795-1-fontaine.fabrice@gmail.com>
References: <20201031210707.960795-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031222245.00299e40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 22:07:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libcap is an optional dependency which is available since version 7:
> https://github.com/NeoRaider/fastd/commit/eaac49427339a365aac2d3505f567572cfbdbb96
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fastd/Config.in | 1 -
>  package/fastd/fastd.mk  | 9 ++++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
