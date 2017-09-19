From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Sep 2017 18:41:33 +0200
Subject: [Buildroot] [PATCH] qt: Allow enabling of QtWebKit with GCC 6+
In-Reply-To: <20170919091444.34950-1-didin@synopsys.com>
References: <20170919091444.34950-1-didin@synopsys.com>
Message-ID: <20170919184133.77dd6d16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Sep 2017 12:14:44 +0300, Evgeniy Didin wrote:
> Building Qt with QtWebKit on configuration step there is
> a check which disables QtWebKit build with GCC 6+.
> Back in the day nobody thought about building Qt with GCC
> version greater than 5.x. And now with modern GCCs like
> 6.x and 7.x this assumption gets in the way.
> 
> Given in Buildroot today we don't have GCC older than 4.9 
> it should be safe to remove now meaningless check completely.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
> 
> ---
>  configure | 14 --------------
>  1 file changed, 14 deletions(-)

I am not sure what you expect us to do with this patch: indeed it is
not a Buildroot patch as Buildroot does not have a configure script.

Perhaps you wanted instead to do a patch that adds a patch in
package/qt/ instead ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
