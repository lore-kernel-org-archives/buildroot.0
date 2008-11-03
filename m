From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Mon, 03 Nov 2008 22:25:55 +0900
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <87bpwxdkz8.fsf@macbook.be.48ers.dk>
References: <20081030094501.66983ff9@surf> <490EF318.5030004@ruby.dti.ne.jp>
	<87bpwxdkz8.fsf@macbook.be.48ers.dk>
Message-ID: <490EFBE3.5030205@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> No, these are settings for the external toolchain, E.G. configuration
> options you have to set to match whatever your external toolchain has.

Sure.

> Don't get misled by the fact that we have the same configuration
> variables (with different help text) for the normal buildroot
> toolchain.

I know that, of course.

This patch (and probably your comments) seems to overlook toolchains
built with _multi libraries_.  Please do not assume toolchain's default
options or default configurations, especially when we talk about
external toolchain support.

Thanks,

  Shinya
