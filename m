From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Sep 2010 21:17:52 +0200
Subject: [Buildroot] [PATCH 1/1] linux: don't force no initramfs
In-Reply-To: <c04f9e9d7019744ced2f2abe198118ad1c23a819.1284326139.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 12 Sep 2010 23:15:47 +0200")
References: <cover.1284326139.git.thomas.petazzoni@free-electrons.com>
	<cover.1284326139.git.thomas.petazzoni@free-electrons.com>
	<c04f9e9d7019744ced2f2abe198118ad1c23a819.1284326139.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874odq7r4v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When initramfs was not selected as a root filesystem, we forcefully
 Thomas> disabled the initramfs in the kernel configuration.

 Thomas> However, it prevents an user from manually managing its initramfs, as
 Thomas> we override the option he has set in his kernel configuration
 Thomas> file. There's no real reason to do so: when initramfs is not selected
 Thomas> as the root filesystem, just don't touch initramfs related options in
 Thomas> the kernel configuration.

 Thomas> Problem reported by Sergey Naumov <sknaumov@gmail.com>.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
