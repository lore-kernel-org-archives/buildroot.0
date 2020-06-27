From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 17:12:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Fix FTBFS with gcc10
In-Reply-To: <20200627114314.2391692-1-bernd.kuhls@t-online.de>
References: <20200627114314.2391692-1-bernd.kuhls@t-online.de>
Message-ID: <20200627171227.1ed12967@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Jun 2020 13:43:14 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Bug was reported upstream:
> https://sourceforge.net/p/minidlna/patches/182/

This bug doesn't seem at all to match this gcc10 build issue. Am I
missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
