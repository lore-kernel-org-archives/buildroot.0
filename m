From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 1 Apr 2016 12:37:36 +0200
Subject: [Buildroot] [PATCH 1/2] configs/qemu_xtensa_lx60_defconfig:
	switch to dc233c
In-Reply-To: <1459502524-23349-2-git-send-email-jcmvbkbc@gmail.com>
References: <1459502524-23349-1-git-send-email-jcmvbkbc@gmail.com>
 <1459502524-23349-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160401103736.GP5944@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Max Filippov wrote,

> dc232b is MMUv2 core, dc233c is very similar MMUv3 core. MMUv3 is the
> latest full MMU for xtensa, which allows running both MMU and noMMU
> linux variants.
> Update configuration overlay and linux config file.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Tested-by: Waldemar Brodkorb <wbx@openadk.org>

The second patch can only be used on top of the ARM noMMU switch, as
the tag for elf2flt doesn't reference a Xtensa capable elf2flt.

Please switch to elf2flt from github, I wanna close my copy soon.

best regards
 Waldemar
