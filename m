From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 00:39:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnpp: remove unneeded
 static workaround
In-Reply-To: <20200216145204.272998-1-fontaine.fabrice@gmail.com>
References: <20200216145204.272998-1-fontaine.fabrice@gmail.com>
Message-ID: <20200219003935.7406511e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Feb 2020 15:52:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libupnpp uses pkg-config since version 0.15.1 and
> https://opensourceprojects.eu/p/libupnpp/code/ci/3dc44417e868b9b4417cbc15f8173e0a2e142b17
> so remove unneeded static workaround
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libupnpp/libupnpp.mk | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
