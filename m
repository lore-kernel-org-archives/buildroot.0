From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 15:13:25 +0100
Subject: [Buildroot] [PATCH] dhcpcd: blacklist Sourcery PowerPC
 toolchains
In-Reply-To: <4baeea60ab360e4c92976a3599c4b1cba5ff5bfb.1419953394.git.baruch@tkos.co.il>
References: <4baeea60ab360e4c92976a3599c4b1cba5ff5bfb.1419953394.git.baruch@tkos.co.il>
Message-ID: <20141231151325.08a7e7e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 30 Dec 2014 17:29:55 +0200, Baruch Siach wrote:
> The linux/socket.h header in these toolchains is broken as described in commit
> f5866484ffe (libnftnl: exclude for CS PPC toolchains).
> 
> Fixes:
> http://autobuild.buildroot.net/results/d92/d92e7f2af0e64bc40f7b5c9ea081471de98bf8e8/
> http://autobuild.buildroot.net/results/e97/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
> http://autobuild.buildroot.net/results/ca3/ca32c4de8b645c96cedb80b6270a792e9601ad84/
> 
> and some more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
