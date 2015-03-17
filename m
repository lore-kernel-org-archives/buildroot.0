From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 10:45:33 -0300
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150315221722.3645eb35@free-electrons.com>
References: <20150315221722.3645eb35@free-electrons.com>
Message-ID: <55082FFD.30305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/15/2015 06:17 PM, Thomas Petazzoni wrote:

> Hello Gustavo,
> 
> I believe you originally added the support to build a Blackfin
> toolchain with the Buildroot internal toolchain backend. Today, I've
> added an external Blackfin toolchain built by Buildroot in the
> autobuilder, and one build failure occurred with this toolchain, on the
> Bellagio package:

Hi.
I'll take a look, but my efforts regarding the blackfin toolchain were a
"best effort" scenario - just getting the toolchain to build where it
didn't before.
I have no hardware to test anything so even if it builds it might not
work correctly at all.
In the mean time i've sent a patch to switch blackfin's default to an
external (ADI) toolchain.
Regards.
