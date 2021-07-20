From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Jul 2021 00:02:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: add SELinux module
In-Reply-To: <20210603184145.349794-1-fontaine.fabrice@gmail.com>
References: <20210603184145.349794-1-fontaine.fabrice@gmail.com>
Message-ID: <20210721000239.51b6e6d0@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  3 Jun 2021 20:41:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Support for bird is added by the services/bird module in the SELinux
> refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bird/bird.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
