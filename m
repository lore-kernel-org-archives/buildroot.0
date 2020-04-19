From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:18:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pysmb: select pyasn1
 instead of pyasn
In-Reply-To: <20200413231230.123828-1-james.hilliard1@gmail.com>
References: <20200413231230.123828-1-james.hilliard1@gmail.com>
Message-ID: <20200419101817.13868524@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 17:12:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The python-pyasn package is an outdated version of python-pyasn1 and
> should not be used.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pysmb/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
