From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:58:54 +0200
Subject: [Buildroot] [PATCH 3/4] package/libsemanage: Add host-audit as
 a dependency.
In-Reply-To: <CAFSsvmq-=5_dJhN=5sxg-zJd6fQ6eCBtObrcRO2WpMdOZmnJUA@mail.gmail.com>
References: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
 <1468518424-11785-3-git-send-email-Aduskett@gmail.com>
 <20160715034105.GA3870@tarshish>
 <CAFSsvmq-=5_dJhN=5sxg-zJd6fQ6eCBtObrcRO2WpMdOZmnJUA@mail.gmail.com>
Message-ID: <20160716155854.46cce6e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 12:45:27 -0400, Adam Duskett wrote:

> > This does not explain why you add host-audit as a dependency of
> > host-libsemanage.
> >
> > baruch
> >  
> libsemanage requires audit as a dependency.
> Thus; host-libsemanage requires host-audit as a dependency.

This is not that clear: for numerous packages we have different
dependencies between the target variant and the host variant. For the
target variant, we provide the possibility of using numerous features.
However, for the host variant, we generally enable the minimal amount
of features.

So we really need a better justification.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
