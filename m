From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:29:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/libyaml: bump version to 0.1.7
In-Reply-To: <20170917093649.21801-1-bernd.kuhls@t-online.de>
References: <20170917093649.21801-1-bernd.kuhls@t-online.de>
Message-ID: <20170917182922.139664f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Sep 2017 11:36:48 +0200, Bernd Kuhls wrote:
> Switched _SITE to github.com because pyyaml.org is down, added
> _AUTORECONF = YES because the upstream tarball does not contain a
> configure script.

pyyaml.org is not down (anymore). Could you use it instead ?

I'll mark both this patch and PATCH 2/2 as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
