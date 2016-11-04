From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 4 Nov 2016 21:47:00 -0200
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <b6863c63-d744-1e73-20b0-c895d9e74012@mind.be>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <b6863c63-d744-1e73-20b0-c895d9e74012@mind.be>
Message-ID: <CAOMZO5BqVbb8PUQvFcwLB2Dnc2jRD_h0gtPY3Yc2CSywi-rsyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, Nov 4, 2016 at 9:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  I only get this error when makedevs is run for the second time, i.e. when
> building the tarball, not the ext2. But perhaps you took this log by re-running
> the build?

The error happens for me even if I start a fresh build:
make clean
make warp7_defconfig
make

Thanks,

Fabio Estevam
