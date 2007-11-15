From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Thu, 15 Nov 2007 14:58:57 +0100
Subject: [Buildroot] Illegal Instruction in arm buildroot
In-Reply-To: <896058.54769.qm@web26215.mail.ukl.yahoo.com>
References: <896058.54769.qm@web26215.mail.ukl.yahoo.com>
Message-ID: <473C50A1.8090201@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael,

thank you for your response.

> Maybe you have some soft-float operation and the kernel e/o toolchain
> doesn't have the support

I have searched the config files for soft_float  options, but the only
section that provides that is on the external_toolchain

happycactus at cammello:~/buildroot> grep SOFT_FLOAT */*/Config.in
toolchain/external-toolchain/Config.in:config BR2_SOFT_FLOAT


and

happycactus at cammello:~/buildroot> grep FLOAT local/freescan/*
local/freescan/freescan.config:# BR2_SOFT_FLOAT is not set
local/freescan/freescan.config:# BR2_PACKAGE_LIBFLOAT is not set
local/freescan/uclibc-0.9.29.config:UCLIBC_HAS_FLOATS=y
local/freescan/uclibc-0.9.29.config:UCLIBC_HAS_HEXADECIMAL_FLOATS=y

So I am not sure to have really understood your suggestion.
Can you explain? Thank you in advance!

Best regards,

ing. Federico Fuga
