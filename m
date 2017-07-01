From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:41:58 +0200
Subject: [Buildroot] [PATCH 0/9] support/testing: run tests in parallel
In-Reply-To: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
References: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
Message-ID: <20170701194158.6089735d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Jun 2017 23:45:40 -0300, Ricardo Martincoski wrote:

> Ricardo Martincoski (9):
>   support/testing: use pexpect in emulator
>   support/testing: use qemu stdio in emulator
>   support/testing: let pexpect write stdout to log
>   support/testing: use pexpect.sendline directly
>   support/testing: use pexpect.expect directly
>   support/testing: fix code style in emulator
>   support/testing: allow to set BR2_JLEVEL
>   support/testing: run testcases in parallel
>   support/testing: large timeout for login prompt

All applied to master. Many thanks for this work, definitely very
useful!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
