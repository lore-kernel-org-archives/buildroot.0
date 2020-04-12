From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:49:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/wget: add optional dependency
 to libiconv
In-Reply-To: <20200316191527.551576-1-bernd.kuhls@t-online.de>
References: <20200316191527.551576-1-bernd.kuhls@t-online.de>
Message-ID: <20200412154920.78daa2f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Mar 2020 20:15:27 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> wget has an optional dependency to libiconv:
> http://git.savannah.gnu.org/cgit/wget.git/tree/configure.ac#n344
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wget/wget.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
