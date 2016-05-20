From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 May 2016 09:35:57 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <4784d6a9-fc6a-de4c-9e4f-7d7daf418d91@mind.be>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
 <573E0B51.7010000@zacarias.com.ar>
 <4784d6a9-fc6a-de4c-9e4f-7d7daf418d91@mind.be>
Message-ID: <20160520093557.6a46ce40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 23:31:32 +0200, Arnout Vandecappelle wrote:

> > No no no, the other was a _restgpr_31_x issue ;)
> > The recurring problem is that gcc targetting powerpc has bugs when using -Os.
> > We could override per-package given this condition, or simply switch to -O2 as
> > default for powerpc. I'm more inclined for the second option.  
> 
>  Even better: disallow -Os completely for powerpc. If it's fixed in recent gcc
> we can add a gcc version dependency as well.

+1 on this suggestion.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
