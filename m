From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 19:06:31 +0200
Subject: [Buildroot] Generating a defconfig
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C34AFB@svr-wa-exch1.atg.lc>
References: <56002C63.1070806@synopsys.com>
 <944894A3EB1D044A9003B2F944389BB20474C34AFB@svr-wa-exch1.atg.lc>
Message-ID: <20150921190631.7e434039@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tommy Lee,

On Mon, 21 Sep 2015 10:01:44 -0700, Lee, Tommy wrote:

> I believe you need to do the "make linux-menuconfig" command to
> create your own .config file. To my knowledge, all the
> configs/defconfig files come along the Buildroot installation. They
> might not be good for your board.

"make linux-menuconfig" will fire-up the kernel menuconfig tool to
customize the kernel configuration. It will certainly not generate a
Buildroot defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
