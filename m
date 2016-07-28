From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 23:35:47 +0200
Subject: [Buildroot] [PATCH v2] iperf: fix "speed" display in CSV report
In-Reply-To: <037EF233-5A06-45DC-A231-55ED9B186CD9@gmail.com>
References: <1469725165-18180-1-git-send-email-matthew.weber@rockwellcollins.com>
 <037EF233-5A06-45DC-A231-55ED9B186CD9@gmail.com>
Message-ID: <20160728233547.68a4656d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 10:46:44 -0700, Khem Raj wrote:

> c99 says if you are printing uint64_t then its portable to use PRIu64 e.g.
> 
> uint64_t a_int64
> printf("%" PRId64 "\n?, a_int64);

Indeed. Matt, could you rework your patch accordingly?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
