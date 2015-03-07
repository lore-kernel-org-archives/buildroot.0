From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:43:24 +0100
Subject: [Buildroot] [git commit] toolchain: add link-time-optimization
 support
In-Reply-To: <54FB28C5.5040107@mind.be>
References: <20150307142749.E241880468@busybox.osuosl.org>
 <54FB23E5.3050707@mind.be>
 <20150307172438.73f5a634@free-electrons.com>
 <54FB28C5.5040107@mind.be>
Message-ID: <20150307174324.18dd04f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 07 Mar 2015 17:35:17 +0100, Arnout Vandecappelle wrote:

>  That's precisely what I mean. As far as I know, there isn't a single package
> where we pass something like --disable-lto. Now, I'm not sure if there is any
> package at all that will automatically turn on lto, but if there are then I
> think we should build it.

Ok.

>  However, I just realized that we are already building with external sourcery
> and linaro toolchains that support lto. So we already have the tests that I wanted.

Right. But that shouldn't prevent us from enabling LTO once a while in
the autobuilders for internal toolchain builds, so your original idea
is still useful :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
