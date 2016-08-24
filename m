From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 14:46:36 +0200
Subject: [Buildroot] [PATCH v5 6/7] package/amd-catalyst: Add support
 AMD CCCLE
In-Reply-To: <57BD4F43.1070200@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-7-romain.perier@free-electrons.com>
 <20160823215910.0ae50be6@free-electrons.com>
 <57BD4F43.1070200@free-electrons.com>
Message-ID: <20160824144636.22481efa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 09:39:47 +0200, Romain Perier wrote:

> I have just checked, it looks good.

There was actually an issue: a circular dependency in the Config.in
options. I've fixed that up in
https://git.buildroot.org/buildroot/commit/?h=next&id=652d674e066e9c1b8eec9057778d2c9a34f8261d.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
