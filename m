From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 16:07:48 +0100
Subject: [Buildroot] [PATCH] package/collectd: make network crypto
 support discoverable
In-Reply-To: <20200311133504.13911-1-p.debruijn@unilogic.nl>
References: <20200311133504.13911-1-p.debruijn@unilogic.nl>
Message-ID: <20200322160748.4603b75b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 14:35:04 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> before it was completely non-obvious how to get crypto support
> in collectd's network module
> 
> this introduces a collectd config option which makes sure
> gcrypt is built, and can't be accidentally unselected
> resulting in an accidental non-crypto build of collectd
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/collectd/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
