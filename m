From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:55:50 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.12.0
In-Reply-To: <47939b206ec286f2ac9226b96a5b65fd2aa75991.1500377145.git.baruch@tkos.co.il>
References: <47939b206ec286f2ac9226b96a5b65fd2aa75991.1500377145.git.baruch@tkos.co.il>
Message-ID: <20170718235550.553abccb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 14:25:45 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add uClibc-ng compatibility fix. This is needed due to missing definition in
> netinet/in.h.
> 
> Correct the license. Source files license headers include the GPL "or ... any
> later version" language.

If I'm not mistaken, this change in the license is not related to the
4.12.0 bump. I looked at the 4.11.0 version, and it already contains
"or .. any later version".

So it seems like the license change should be in a separate patch,
which should be backported to our LTS/maintenance branches.

Could you double check this and if you agree send separate patches?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
