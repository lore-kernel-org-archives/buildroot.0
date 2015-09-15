From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:11:24 +0200
Subject: [Buildroot] [PATCH] Enable vlc to run as root
In-Reply-To: <55F821BD.4010006@synopsys.com>
References: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442322597.git.jpinto@synopsys.com>
 <55F81E45.1020305@imgtec.com> <55F821BD.4010006@synopsys.com>
Message-ID: <20150915231124.76245a4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2015 14:48:45 +0100, Joao Pinto wrote:

> >> This patch has the goal of enabling vlc to be ran as root.
> >>
> >> Signed-off-by: jpinto <jpinto@synopsys.com>
> >> Tested-by: jpinto <jpinto@synopsys.com>
> > 
> > Use your full name here.
> 
> Ok, in future patches I will do it.

We actually need your full name for this patch as well. Signed-off-by
is a legal statement, so we need people to use their full name.

Can you send a v2 of your patch?

> > I don't know if running vlc as root is disabled by default due to
> > security reasons, but if so, perhaps we could do this selectable by the
> > user via menuconfig.

I don't think this is necessary. We don't do that for any of the other
packages in Buildroot. So from my point of view, the patch is OK, it
only needs to be resubmitted with a full name (as the From and in
Signed-off-by).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
