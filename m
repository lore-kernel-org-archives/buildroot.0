From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 May 2015 09:26:29 +0200
Subject: [Buildroot] [PATCH] libgcrypt: allow optimization
In-Reply-To: <1432958452-22626-1-git-send-email-danomimanchego123@gmail.com>
References: <1432958452-22626-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20150530092629.41d8ab7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat, 30 May 2015 00:00:52 -0400, Danomi Manchego wrote:
> Drop the --disable-optimization option, which makes the libgcrypt
> configure remove buildroot's optimation setting passed in from CFLAGS.

Your SoB line is missing. Otherwise I believe this is good to go, and
should be in 2015.05.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
