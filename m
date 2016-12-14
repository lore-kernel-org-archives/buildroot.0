From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 15:20:28 +0100
Subject: [Buildroot] [PATCH 1/3] package/gdb: add support for gdb 7.12
In-Reply-To: <20161214134058.29826-1-joerg.krause@embedded.rocks>
References: <20161214134058.29826-1-joerg.krause@embedded.rocks>
Message-ID: <20161214152028.4b2caf8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Dec 2016 14:40:56 +0100, J?rg Krause wrote:
> gdb 7.12 was released on October 2016, it's time to include it in
> Buildroot, which this commit does.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

We have one patch on gdb 7.11.1. Is it still needed? I know I reported
the problem to Mike Frysinger, so he might have fixed it upstream, but
I haven't followed. It's worth double checing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
