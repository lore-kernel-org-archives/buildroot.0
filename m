From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Sep 2017 17:16:54 +0200
Subject: [Buildroot] [git commit] bind: fix compilation when lmdb.h is
 present on host
In-Reply-To: <20170910165353.19203dab@gmx.net>
References: <20170909201815.9BA4F80298@busybox.osuosl.org>
 <20170910165353.19203dab@gmx.net>
Message-ID: <20170910171654.36c4e5db@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Sep 2017 16:53:53 +0200, Peter Seiderer wrote:


> Double fix of the same problem, earlier fix/commit bb95fef1e0bec4ebc0584001f337438b17c4744d
> using '--without-lmdb', now the complete CONF_OPTS are:

Gah, thanks for noticing. I've reverted this commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
