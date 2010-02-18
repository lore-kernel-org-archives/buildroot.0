From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Feb 2010 12:01:06 +0100
Subject: [Buildroot] [PATCH] 2010.02-rc1 at91sam9260pf_defconfig
In-Reply-To: <815f0bd71002171828u4ac0f44dgc0df709ef7278a3d@mail.gmail.com>
	(Roo's message of "Thu, 18 Feb 2010 13:28:03 +1100")
References: <815f0bd71002171828u4ac0f44dgc0df709ef7278a3d@mail.gmail.com>
Message-ID: <87fx4y24gd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roo" == Roo  <roo.watt@gmail.com> writes:

Hi,

 Roo> I am new to buildroot, so if I should have done anything
 Roo> differently please let me know. I promise not to take in
 Roo> personally. :)

Thanks, committed. The patch contents was fine, but you made a few small
mistakes:

- You didn't configure your email program to use your full name /
  address
- Your commit message (top of mail) didn't explain what your patch fixes
- You didn't sign off on the change (git format-patch -s)
- Your patch was line wrapped by your mailer.

Please consider using git format-patch -s / git send-email in the
future, that will ensure you get (most) of those details correct.

-- 
Bye, Peter Korsgaard
