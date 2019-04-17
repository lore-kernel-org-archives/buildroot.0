From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:56:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: bump to version 1.20
In-Reply-To: <20190411181048.12392-1-fontaine.fabrice@gmail.com>
References: <20190411181048.12392-1-fontaine.fabrice@gmail.com>
Message-ID: <20190417085618.720e6563@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Apr 2019 20:10:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add hash for license file
> - Enable parallel build: it has been fixed since version 1.19b and
>   https://github.com/yrutschle/sslh/commit/70a2ea926efc8ca455b08d230b90789a57bc29c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sslh/sslh.hash | 3 ++-
>  package/sslh/sslh.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
