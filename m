From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:31:54 +0200
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
	efi}_defconfig: unbreak after qemu bump to linux-4.11
In-Reply-To: <FE617696-0325-4F4C-B91C-38CCE98C76B6@openadk.org> (Waldemar
 Brodkorb's message of "Thu, 15 Jun 2017 08:36:36 +0200")
References: <20170614213604.10067-1-peter@korsgaard.com>
 <FE617696-0325-4F4C-B91C-38CCE98C76B6@openadk.org>
Message-ID: <87d1a5k35h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Hi,
 >> Am 14.06.2017 um 23:36 schrieb Peter Korsgaard <peter@korsgaard.com>:
 >> 
 >> The pc_x86_64 defconfigs reuse the linux configuration from qemu_x86_64, ..

 > Wouldn't it be better to decouple the usage of the configs. I find it
 > not obvious that they share the same kernel config.

True. I've pushed this commit + a commit to use a dedicated linux
config for these pc defconfigs.

-- 
Bye, Peter Korsgaard
