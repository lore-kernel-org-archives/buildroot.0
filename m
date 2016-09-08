From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 21:58:33 +0200
Subject: [Buildroot] [PATCH 1/2] syslog-ng: add optional support for
 libnet build
In-Reply-To: <20160908100118.5723-1-judge.packham@gmail.com>
References: <20160908100118.5723-1-judge.packham@gmail.com>
Message-ID: <20160908215833.79eaa1a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 22:01:17 +1200, Chris Packham wrote:
> If libnet is included pass --enable-spoof-source to configure otherwise
> pass --disable-spoof-source. This stops syslog-ng's configure from
> enabling address spoofing based on the build host having libnet
> installed.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/71c733e4a7275f3a1b79cd19065d94e77af0309b
>   http://autobuild.buildroot.net/results/d16ba0b9ef75d5a676a26db788be31556b69772a
>   http://autobuild.buildroot.net/results/9659d1db1a128b269459fd9b8be797a9efbd35af
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
