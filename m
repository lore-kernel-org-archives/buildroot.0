From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 25 Oct 2016 09:59:54 +0200
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
 <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be>
Message-ID: <3048503.7rCYbyTDax@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnoult,

On Monday 17 October 2016 18:52:43 Arnout Vandecappelle wrote:
> On 17-10-16 18:02, Gustavo Zacarias wrote:
> [snip]
> 
> > And then there's PPL (Per-Package Logging) since looking at the
> > output when building TLP makes debugging very hard, so having a
> > per-package configure/build/install/etc log will make life easier
> > (with a decent playback when things go bad).
> 
>  Would be great, but isn't that super-complicated or wouldn't it
> require major surgery to the infrastructure? You'd need to somehow
> amend the _CMDS to redirect their output, or run every package in a
> separate sub-make, or something like that...

Even if I think it can't be an official solution, some time ago I 
suggested a hack to redirect output of Buildroot in separate log files:

  http://lists.busybox.net/pipermail/buildroot/2014-November/112991.html

I think it should also work with top level parallelization.


BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
