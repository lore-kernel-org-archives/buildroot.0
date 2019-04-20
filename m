From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:34:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: rewrite init script
In-Reply-To: <20190418131956.3199-1-fontaine.fabrice@gmail.com>
References: <20190418131956.3199-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420163428.4fe5789e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 15:19:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Follow new S02klogd template
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/S99domoticz | 61 ++++++++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 24 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
