From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 09:13:09 +0100
Subject: [Buildroot] [PATCH 3/3] package/vlc: switch to libupnp-1.8
In-Reply-To: <20171214073134.28696-3-bernd.kuhls@t-online.de>
References: <20171214073134.28696-1-bernd.kuhls@t-online.de>
 <20171214073134.28696-3-bernd.kuhls@t-online.de>
Message-ID: <20171214091309.30c09d55@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Dec 2017 08:31:34 +0100, Bernd Kuhls wrote:
> Vlc now supports libupnp-1.8:
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commitdiff;h=825dca78be3a81e2a1c5d04137aa01b1cb32dfd3

Reading this commit, it seems like the old version should still be
supported, no?

So: why does it fail to build? Why don't we keep supporting the old
version as well?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
