From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 14:15:20 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
 postgresql
In-Reply-To: <20150411120739.GF4221@free.fr>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
 <20150411124226.726fde30@free-electrons.com>
 <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150411120739.GF4221@free.fr>
Message-ID: <20150411141520.4060c6a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 11 Apr 2015 14:07:39 +0200, Yann E. MORIN wrote:

> Unfortunately, pg_config is a binary, so we provide our own minimalist
> one, which does not implement --libs.

So, shouldn't we simply implement --libs in our own pg_config
implementation?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
