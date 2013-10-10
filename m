From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 09:57:44 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
 toolchain
In-Reply-To: <52564EFD.10506@mind.be>
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be>
Message-ID: <20131010095744.5690a242@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 10 Oct 2013 08:53:49 +0200, Arnout Vandecappelle wrote:

>   I believe I asked this before: do we really want to remove external 
> toolchains without going through a deprecation cycle? Why do we offer in 
> a released buildroot three different Linaro toolchain versions that are 
> all gcc 4.8 and that you cannot use anymore three months later?

Linaro toolchains are released every month, so they are moving quickly.
What are you proposing to do to handle this?

Have just a BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM option, which maps
automatically to the latest version of the toolchain, like we do for
packages?

Or do you suggest to preserve toolchains? For how long?

Until now, the arbitrarily chosen policy was to keep only three
versions of a given toolchain. For Sourcery CodeBench toolchains, I
believe it works quite well because the frequency of releases is not
too high. However, it's true that for Linaro toolchains, it may not be
appropriate, but I'm not sure what to do exactly.

Thanks for your suggestions,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
