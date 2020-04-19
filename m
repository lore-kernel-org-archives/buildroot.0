From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:18:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: select
 pyasn1 instead of pyasn
In-Reply-To: <20200413230521.123397-1-james.hilliard1@gmail.com>
References: <20200413230521.123397-1-james.hilliard1@gmail.com>
Message-ID: <20200419101813.24af63df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 17:05:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The python-pyasn package is an outdated version of python-pyasn1 and
> should not be used.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-service-identity/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
