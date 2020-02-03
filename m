From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:44:15 +0100
Subject: [Buildroot] [PATCH] package/systemd: use interface for networkd
 config file
In-Reply-To: <20200108104439.7041-1-p.debruijn@unilogic.nl>
References: <20200108104439.7041-1-p.debruijn@unilogic.nl>
Message-ID: <20200203234415.7227f506@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jan 2020 11:44:39 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> by using the interface in the filename for the networkd config
> file, we have a clear association between the config file and
> the interface it applies to.
> 
> this is benefitical for systems that have multiple interfaces.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/systemd/systemd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
