From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:19:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/xz: fix whitespace
In-Reply-To: <20190410205105.9580-1-fontaine.fabrice@gmail.com>
References: <20190410205105.9580-1-fontaine.fabrice@gmail.com>
Message-ID: <20190411081933.3f625eb6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 22:51:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> A strange unicode character was used instead of a standard white space
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xz/xz.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
