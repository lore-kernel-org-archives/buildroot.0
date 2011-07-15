From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Jul 2011 11:38:55 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Fri, 15 Jul 2011 11:34:13
 +0200")
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <201107151122.41685.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
Message-ID: <87wrfjano0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 >> Or you can use the BR2_LINUX_KERNEL_VERSION variable:
 >> ?output/build/linux-${BR2_LINUX_KERNEL_VERSION}/

 Thomas> This works fine in the context of buildroot. However, I need to access
 Thomas> these files from a non-buildroot context (external makefiles/scripts)
 Thomas> and so the variable BR2_LINUX_KERNEL_VERSION is not known.

You can always use wildcards - E.G. output/build/linux-*/scripts/..

-- 
Bye, Peter Korsgaard
