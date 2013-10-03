From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 13:21:24 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] manual: add section about
 depending on target and toolchain options
In-Reply-To: <524D50D0.8060906@mind.be>
References: <patchbomb.1380099393@argentina>
 <679aaf4f4d6cb323f13d.1380099395@argentina>
 <524D00D9.9070800@mind.be>
 <CAAXf6LXLV59szv9d-7FJJdGE=cOvvDowTTZGpWep5vyFFxJ2jQ@mail.gmail.com>
 <524D50D0.8060906@mind.be>
Message-ID: <20131003132124.33f8e945@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 03 Oct 2013 13:11:12 +0200, Arnout Vandecappelle wrote:

>   The dynamic library support is anyway a bit of a problem, because
> it bears little relation to the config option "prefer static
> libraries". That part, however, will hopefully be fixed when the
> other Thomas adds the choice between static-only, dynamic-only and
> both.

I have patches that do this, they need a bit more testing, but I should
probably send them as a RFC.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
