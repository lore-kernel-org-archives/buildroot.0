From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 12:06:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-12-10
In-Reply-To: <548AC92B.8060705@imgtec.com>
References: <20141211073016.EFDC7100E7A@stock.ovh.net>
 <5489D6E2.1010002@imgtec.com> <20141211175508.GQ2440@tarshish>
 <5489DB5F.2000101@imgtec.com> <548AC92B.8060705@imgtec.com>
Message-ID: <20141212120632.6015df71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 12 Dec 2014 10:53:31 +0000, Vicente Olivert Riera wrote:

> As you can see, -ncurses and -lpanel are passed in the compile line,
> so..., I don't know what to do now :/

Trying changing the order of -lncurses and -lpanel, for static linking,
the order is important.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
