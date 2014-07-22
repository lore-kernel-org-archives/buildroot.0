From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 22 Jul 2014 11:37:16 +0200
Subject: [Buildroot] [PATCH] qemu/mips64-malta: update defconfig to
 Linux 3.15.x
In-Reply-To: <53CD9046.80806@zacarias.com.ar>
References: <20140721201340.GA31551@waldemar-brodkorb.de>
 <20140721223512.2207d08c@free-electrons.com>
 <53CD7A09.5040608@zacarias.com.ar>
 <20140722000826.05422f03@free-electrons.com>
 <53CD9046.80806@zacarias.com.ar>
Message-ID: <20140722093716.GL4431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

> On 07/21/2014 07:08 PM, Thomas Petazzoni wrote:
> 
> > So maybe, Waldemar, could you respin with CONFIG_EXT4 +
> > CONFIG_EXT4_USE_FOR_EXT23 ?
> > 
> > Thanks a lot!
> 
> CONFIG_EXT4_USE_FOR_EXT23 is default y when there's EXT4, which is the
> case right now, i did the config after all.
> On the BR side i kept ext2 output because it was the standard norm for
> disk-backed samples, but we can always change that.
> Regards.

Should I respin the patches to use ext4 instead of ext2 for
qemu/mips-malta and qemu/mipsel-malta?

Didn't know that a genextfs filesystem could be converted to
ext3/ext4. And indeed when using ext4, all three types can be
used to bootup a system.

best regards
 Waldemar
