From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 May 2021 21:46:26 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk: Change URL to Github
In-Reply-To: <cfde71bd-a3e5-3d3a-d150-8c8cd3e7cc7c@mind.be>
References: <20210504210026.1916260-1-aduskett@gmail.com>
 <20210504210026.1916260-2-aduskett@gmail.com>
 <20210505203837.GV2137340@scaer>
 <cfde71bd-a3e5-3d3a-d150-8c8cd3e7cc7c@mind.be>
Message-ID: <20210506194626.GW2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2021-05-06 08:53 +0200, Arnout Vandecappelle spake thusly:
> On 05/05/2021 22:38, Yann E. MORIN wrote:
> > So, this is not good, because that means the archives we have on s.b.o
> > would not longer match what we want to download, so s.b.o can't be used
> > as a fallback for master anymore.
>  There's a trivial workaround: drop OPENJDK_SOURCE = .... That way, the tarball
> name becomes openjdk-... instead of jdk-... and it's a different file.

That was my initial proposal, but Adam reinstated the _SOURCE variable,
and I have no idea why I did not further challenge that before
applying...

Indeed, it works (patch pending...) Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
