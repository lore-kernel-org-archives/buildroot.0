From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:36:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: put back zlib
 dependency
In-Reply-To: <20200315222505.673895-1-fontaine.fabrice@gmail.com>
References: <20200315222505.673895-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315233647.3d1fe0eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2020 23:25:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zlib dependency was wrongly removed by commit
> 3037e99ae67f159626c0b148da46008e1dd23e91
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/libcpprestsdk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gaah. Some leftovers from my tests sneaked into this commit following a
git commit --amend. I guess I should stop Buildroot stuff for today.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
