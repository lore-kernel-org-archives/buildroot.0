From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:47:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: don't build
 cryptest.exe
In-Reply-To: <20190309143019.11506-1-fontaine.fabrice@gmail.com>
References: <20190309143019.11506-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309214700.4af4a140@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 15:30:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace install target by install-lib target to avoid building and
> installing cryptest.exe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cryptopp/cryptopp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
