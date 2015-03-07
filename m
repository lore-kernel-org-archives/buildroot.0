From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 16:04:24 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <20150307141903.4a4c3b4f@free-electrons.com>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com>
 <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
 <54F7898A.6090601@free.fr> <20150306231558.GE4220@free.fr>
 <20150307090354.60c844a3@free-electrons.com>
 <20150307130141.GB4186@free.fr>
 <20150307141903.4a4c3b4f@free-electrons.com>
Message-ID: <20150307150424.GF4186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-07 14:19 +0100, Thomas Petazzoni spake thusly:
> On Sat, 7 Mar 2015 14:01:42 +0100, Yann E. MORIN wrote:
> > Given the feedback from Bernd, I'll see at adding such a version choice.
> > Let's say we go this route:
> >   - add a version choice for 1.14.7 (for tegra-binaries) and 1.17.1 (the
> >     current version), defaulting to 17.1;
> >   - add hidden symbols for the driver ABI supported by each version;
> >   - make nvidia-tegra23 depend on the appropriate ABI symbol.
> 
> Seems OK to me. Though it would be good if someone can actually test
> the patches. I don't know when I'll have the time to test on the Tegra
> 3 platform.

Well, we can at least go up to the point where it builds. From there,
you can pick it up when you are available for run-time testing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
