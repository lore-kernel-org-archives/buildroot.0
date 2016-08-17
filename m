From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 23:54:00 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
 archive
In-Reply-To: <20160817213102.GH5778@free.fr>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
 <20160817210314.GG5778@free.fr>
 <CAJsd3zJZ6o3dbCuRC8uZ6CE_41jqmVYbtRrkCQZhEkdmeG_t0Q@mail.gmail.com>
 <20160817213102.GH5778@free.fr>
Message-ID: <20160817235400.43af6dec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 23:31:02 +0200, Yann E. MORIN wrote:

> So, I think it is safe to assume that git-archives always generates
> reproducible archive.

So the only remaining reason to not use git archive all the time is to
support submodules?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
