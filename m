From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 22:38:16 +0100
Subject: [Buildroot] [PATCH v2 0/3] graph-depends: allow to exclude host
 packages
In-Reply-To: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160208223816.4e492668@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jan 2016 21:32:12 +0100, Thomas Petazzoni wrote:

> Here is a v2 of the small patch series that allows to exclude host
> packages. It fixes a major bug in the previous implementation, which
> was stopping drawing the list of dependencies as soon as one host
> package was encountered, rather than just skipping that one package.
> 
> This new implementation hopefully fixes that problem.
> 
> Thanks,
> 
> Thomas
> 
> Thomas Petazzoni (3):
>   graph-depends: fix handling of "virtual" in exclude_list
>   graph-depends: add support for excluding host packages
>   docs/manual: update graph-depends documentation about --stop-on

I've applied those three patches, after fixing the minor nit pointed by
Yann on PATCH 2/3.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
