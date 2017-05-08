From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 8 May 2017 14:14:07 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 2/4] core: allow check-host-cmake.sh to
 try several candidates
In-Reply-To: <20170507161132.GC2949@scaer>
References: <1494131541-2960-1-git-send-email-casantos@datacom.ind.br>
 <1494131541-2960-2-git-send-email-casantos@datacom.ind.br>
 <20170507094706.GB2949@scaer>
 <401111742.21785804.1494170896679.JavaMail.zimbra@datacom.ind.br>
 <20170507161132.GC2949@scaer>
Message-ID: <1996554357.21917191.1494263647817.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Sunday, May 7, 2017 1:11:32 PM
> Subject: Re: [PATCH v2 2/4] core: allow check-host-cmake.sh to try several candidates

>>     $ sh check-host-cmake.sh 3.1 python
>>     Python 2.7.12
>>     check-host-cmake.sh: 35: [: -gt: unexpected operator
>>     check-host-cmake.sh: 38: [: -eq: unexpected operator
> 
> Well, this can only happen in one condition: the 'cmake' (or 'cmake3')
> executable is in fact not CMake, which would be an excessively stupid
> situation...
---8<---
> 
> I'm not against having a stricter regex, but remember what you are
> trying to protect against... And I personally don't think the cases you
> point at would ever happen, unless one of the candidates is in fact not
> CMake.

OK, let's keep the paranoia at its current level. :-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
