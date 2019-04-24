From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 19:38:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix build error due
 to architecture name is incomplete
In-Reply-To: <20190424104402.15468-1-nylon7@andestech.com>
References: <20190424104402.15468-1-nylon7@andestech.com>
Message-ID: <20190424193839.11e7320b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Apr 2019 18:44:01 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Fixes
>   http://autobuild.buildroot.net/results/128/12803a705586e82fdfb49013da2eb3b9879ccd45/
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>

Thanks, but the exact same patch was already merged:

  https://git.buildroot.org/buildroot/commit/arch?id=b58a6bf774baf56c3a73a838acb8a5472594ce82

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
