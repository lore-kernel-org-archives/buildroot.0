From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 8 May 2018 01:42:16 +0900
Subject: [Buildroot] [PATCH] busybox: S01mdev: fix module autoloading
In-Reply-To: <20180507160301.29361-1-peter@korsgaard.com>
References: <20180507160301.29361-1-peter@korsgaard.com>
Message-ID: <CAFr9PXn99tMdPFtXQVKObwnA3-jO-cUBGjHr_JcKoYzVnQG+mA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think you might of missed my last email.

But modaliases with spaces do exist in sysfs:

daniel at espressobin2:/sys/devices/platform/Fixed MDIO bus.0$ cat modalias
platform:Fixed MDIO bus
