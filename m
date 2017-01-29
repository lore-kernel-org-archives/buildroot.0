From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 16:18:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/fbterm: Fix building against
 libiconv
In-Reply-To: <dab1mdxd4l.ln2@ID-313208.user.individual.net>
References: <20170128174916.11214-1-bernd.kuhls@t-online.de>
 <20170129142633.4ba3c0b4@free-electrons.com>
 <dab1mdxd4l.ln2@ID-313208.user.individual.net>
Message-ID: <20170129161856.08b3599d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jan 2017 15:37:33 +0100, Bernd Kuhls wrote:

> I think this is not needed, because fbterm depends on BR2_ENABLE_LOCALE, 
> while libiconv depends on !BR2_ENABLE_LOCALE. The build error occured 
> while including iconv.h from uClibc.

Indeed, makes sense. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
