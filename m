From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:21:52 +0100
Subject: [Buildroot] [PATCH v2] package/libbroadvoice: Broken on BR2_arc
 with gcc <= 4.8
In-Reply-To: <1453038796-7041-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453038796-7041-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160119222152.5c7f61a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 17 Jan 2016 14:53:16 +0100, Bernd Kuhls wrote:
> Please read this bug report for details:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
> 
> Fixes
> http://autobuild.buildroot.net/results/4a1/4a1fd92d1ce4963d3e282ea2dc8f0f6c5db4f1e1/
> http://autobuild.buildroot.net/results/ce3/ce3be7d27489647a98d8932c5bcabd08c845187b/
> http://autobuild.buildroot.net/results/988/988bd189bab37a03c037160d6758774d4aa6c8a0/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: changed logic to "material implication" (Arnout, Mason)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
