From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 12:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
In-Reply-To: <alpine.DEB.2.11.1508031305040.5593@tanhuma.tkos.co.il>
References: <1438590279-25769-1-git-send-email-yba@tkos.co.il>
 <20150803111857.69ada16f@free-electrons.com>
 <alpine.DEB.2.11.1508031229090.5593@tanhuma.tkos.co.il>
 <20150803120134.7d4a133e@free-electrons.com>
 <alpine.DEB.2.11.1508031305040.5593@tanhuma.tkos.co.il>
Message-ID: <20150803122501.2f6aa091@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben Avraham,

On Mon, 3 Aug 2015 13:05:54 +0300 (IDT), Jonathan Ben Avraham wrote:

> So should I submit a PATCH v2?

If it was only for the hash issue, it wouldn't be needed, I would fix
that up when committing.

However, there was another comment in my review that needs to be
addressed:

"""
Could you explain in the commit log why some of the patches are being
removed? Like if they are now upstream, point to the upstream commit?
"""

So indeed for this one, a v2 is needed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
