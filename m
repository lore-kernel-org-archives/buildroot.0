From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jul 2014 19:12:22 -0300
Subject: [Buildroot] [PATCH] qemu/mips64-malta: update defconfig to
 Linux 3.15.x
In-Reply-To: <20140722000826.05422f03@free-electrons.com>
References: <20140721201340.GA31551@waldemar-brodkorb.de>	<20140721223512.2207d08c@free-electrons.com>	<53CD7A09.5040608@zacarias.com.ar>
 <20140722000826.05422f03@free-electrons.com>
Message-ID: <53CD9046.80806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/21/2014 07:08 PM, Thomas Petazzoni wrote:

> So maybe, Waldemar, could you respin with CONFIG_EXT4 +
> CONFIG_EXT4_USE_FOR_EXT23 ?
> 
> Thanks a lot!

CONFIG_EXT4_USE_FOR_EXT23 is default y when there's EXT4, which is the
case right now, i did the config after all.
On the BR side i kept ext2 output because it was the standard norm for
disk-backed samples, but we can always change that.
Regards.
