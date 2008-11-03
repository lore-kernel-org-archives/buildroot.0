From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2008 15:03:20 +0100
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <490EFBE3.5030205@ruby.dti.ne.jp> (Shinya Kuribayashi's message
	of "Mon\, 03 Nov 2008 22\:25\:55 +0900")
References: <20081030094501.66983ff9@surf> <490EF318.5030004@ruby.dti.ne.jp>
	<87bpwxdkz8.fsf@macbook.be.48ers.dk> <490EFBE3.5030205@ruby.dti.ne.jp>
Message-ID: <87d4hcdhzr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shinya" == Shinya Kuribayashi <skuribay@ruby.dti.ne.jp> writes:

 Shinya> This patch (and probably your comments) seems to overlook
 Shinya> toolchains built with _multi libraries_.  Please do not
 Shinya> assume toolchain's default options or default configurations,
 Shinya> especially when we talk about external toolchain support.

Ok, I don't personally use either ext toolchain or multilib, but
patches are welcome.

-- 
Bye, Peter Korsgaard
