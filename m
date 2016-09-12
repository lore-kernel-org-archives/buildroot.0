From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 11:35:20 +0200
Subject: [Buildroot] [PATCH] micropython: add upstream patch to fix
 build failures
In-Reply-To: <20160911211903.21933-1-judge.packham@gmail.com>
References: <20160911211903.21933-1-judge.packham@gmail.com>
Message-ID: <20160912113520.132f4d56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 09:19:03 +1200, Chris Packham wrote:
> This allows micropython to build with a host python version of 2.6.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/212cee82cc9db81cf1524925d106e01fc1e62ce5
>   http://autobuild.buildroot.net/results/4f72a602702f4eac1fe8c4a385ebfeb6e1c50df2
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> I wasn't sure whether to use MICROPYTHON_PATCH += or the line continuation that
> I ended up using. I couldn't find an example of either case. Murphy's law
> dictates that I've probably chosen wrong so I'd be happy to resubmit with the
> other style.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
