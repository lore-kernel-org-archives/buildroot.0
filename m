From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Aug 2017 18:29:59 +0200
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <8c8fd01f-12eb-f91f-2316-294286a2f5aa@mind.be>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner>
 <20170811223048.0c445573@windsurf>
 <20170812094839.70a0c4b1@tux.kirchner>
 <20170812095737.58da25f5@windsurf>
 <20170812150813.ondf3yfcsjcg5443@gportay>
 <8c8fd01f-12eb-f91f-2316-294286a2f5aa@mind.be>
Message-ID: <20170812182959.33997316@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Aug 2017 17:12:37 +0200, Arnout Vandecappelle wrote:

> > BTW, it seems this bug is quite new in Qt; it appeared since QtWebengine 5.9 [2]
> > and [3].
> > 
> > I will check if it requirement to build Qt WebEngine.  
> 
>  Since adding Qt WebEngine to Buildroot is long overdue, I propose to apply it
> with the BR2_HOSTARCH_NEEDS_IA32_COMPILER work-around and resolve this issue later.

Yes, that's fine with me, provided we have a comment on top of this
select BR2_HOSTARCH_NEEDS_IA32_COMPILER that explains the situation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
