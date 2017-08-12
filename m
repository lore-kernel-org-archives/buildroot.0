From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Aug 2017 17:12:37 +0200
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <20170812150813.ondf3yfcsjcg5443@gportay>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner> <20170811223048.0c445573@windsurf>
 <20170812094839.70a0c4b1@tux.kirchner> <20170812095737.58da25f5@windsurf>
 <20170812150813.ondf3yfcsjcg5443@gportay>
Message-ID: <8c8fd01f-12eb-f91f-2316-294286a2f5aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-08-17 17:08, Ga?l PORTAY wrote:
[snip]
> BTW, it seems this bug is quite new in Qt; it appeared since QtWebengine 5.9 [2]
> and [3].
> 
> I will check if it requirement to build Qt WebEngine.

 Since adding Qt WebEngine to Buildroot is long overdue, I propose to apply it
with the BR2_HOSTARCH_NEEDS_IA32_COMPILER work-around and resolve this issue later.

 Regards,
 Arnout

> 
> [1] https://github.com/v8/v8/blob/master/gypfiles/toolchain.gypi#L1000-L1043
> [2] https://bugreports.qt.io/browse/QTBUG-59504
> [3] https://bugreports.qt.io/browse/QTBUG-61873

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
