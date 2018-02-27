From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:25:33 +0100
Subject: [Buildroot] [PATCH 3/3] bind sed
In-Reply-To: <20180227123924.20725-3-chrismcc@gmail.com>
References: <20180227123924.20725-1-chrismcc@gmail.com>
 <20180227123924.20725-3-chrismcc@gmail.com>
Message-ID: <20180227222533.0d75b337@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 04:39:24 -0800, Christopher McCrory wrote:
>     sed script to alter directory locations
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

This cannot be separated from PATCH 2/3, because PATCH 2/3 uses this
sed script, so PATCH 2/3 and 3/3 should be merged together.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
