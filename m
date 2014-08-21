From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:30:11 +0200
Subject: [Buildroot] [PATCH] More descriptive help text for
 usb_modeswitch
In-Reply-To: <1408557893-25786-1-git-send-email-yba@tkos.co.il>
References: <1408557893-25786-1-git-send-email-yba@tkos.co.il>
Message-ID: <20140821153011.4ee92142@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Wed, 20 Aug 2014 21:04:53 +0300, Jonathan Ben-Avraham wrote:
> Improve the help text for usb_modeswitch package for the benefit of the clueless.
> 
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> ---
>  package/usb_modeswitch/Config.in |   13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

I've applied your patch, after tweaking the commit title (it should
always be "<package>: <something>"), rewrapping the help text to a
shorter line length, and slightly adjusting the wording.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
