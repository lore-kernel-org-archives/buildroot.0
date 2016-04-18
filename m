From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 00:12:53 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/opencv: add inter-module
 dependencies
In-Reply-To: <1461010675-8274-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461010675-8274-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160419001253.2ce8c07e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 22:17:54 +0200, Bernd Kuhls wrote:
> As stated by Samuel the opencv2 package lacks inter-module dependencies:
> http://lists.busybox.net/pipermail/buildroot/2016-April/158902.html
> 
> This patch adds the necessary code for freeswitch's mod_cv to compile.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: add more dependencies
> v2: initial release (Samuel)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
