From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2016 23:51:48 +0200
Subject: [Buildroot] [PATCH v2] Config.in: add -Og option
In-Reply-To: <573CCB3C.1040703@surround.io>
References: <1463442955-8178-1-git-send-email-martin@surround.io>
 <7e07c970-b00e-f605-7192-3152d53885e1@mind.be>
 <573CCB3C.1040703@surround.io>
Message-ID: <20160518235148.301cc611@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 13:06:20 -0700, Martin Kelly wrote:

> I will change this and send a revised patch. Note that there are 
> currently several config options that are not all capital (e.g. 
> BR2_STRIP_strip), but perhaps those should change too.

There are indeed previous options that were introduced a long long long
time ago, when we didn't had such a thorough review process.
Unfortunately, changing them is annoying, as it breaks all the
existing .config files for users. For this reason, we try to not rename
options just for the beauty of it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
