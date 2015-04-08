From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:48:55 +0200
Subject: [Buildroot] [PATCH] procps-ng: fix/patch wrong ncursesw headers
 assumption
In-Reply-To: <1428447006-6279-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428447006-6279-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408224855.0b31a7fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  7 Apr 2015 19:50:06 -0300, Gustavo Zacarias wrote:
> The configure script/code assumes ncursesw headers live in
> /usr/include/ncursesw.
> That's a distribution-ism where they want to have both versions for
> ABI/API compatibility, but not the case for embedded where that's not a
> concern.
> Hence kill the hard-coding and use pkg-config to find this out instead
> of the half-made effort about it.
> Fixes:
> http://autobuild.buildroot.net/results/97d/97dc7f238457609c861c24f81b556973f5dec9c1/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
