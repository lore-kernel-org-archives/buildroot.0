From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 23:02:45 +0200
Subject: [Buildroot] Towards 2015.05-rc1
In-Reply-To: <XnsA481E23CAF8E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20150419220053.2c1d5b62@free-electrons.com>
 <XnsA481E23CAF8E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150419230245.64cf1410@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 19 Apr 2015 22:14:24 +0200, Bernd Kuhls wrote:

> if possible and time allows for all involved persons I would like to see the 
> libudev series stuff in the next buildroot release. 

As far as I remember, someone needs to take over this series, no? I
believe you originally authored it, then Yann took over, then Peter
proposed to take over but did not resend it as far as I know.

On my side, I am still a bit concerned by the usefulness of this
series. The use cases you have are anyway running big things (Kodi,
etc.) so I'm not sure why running udevd or not makes a big difference.
It does seem a lot of additional complexity for not such a huge
benefit.

Can you convince me otherwise?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
