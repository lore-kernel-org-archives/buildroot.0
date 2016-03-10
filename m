From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:45:45 +0100
Subject: [Buildroot] [PATCH v7 02/18] core: use $(CURDIR) to set TOPDIR
In-Reply-To: <56E0B6EF.500@mind.be>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
 <56E0B6EF.500@mind.be>
Message-ID: <20160310214545.5428676e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 00:51:11 +0100, Arnout Vandecappelle wrote:
> On 03/09/16 23:58, Samuel Martin wrote:
> > This changes saves a shell call and uses a variable automatically set
> > by make [1].
> 
>   Wouldn't it be better to just use $(CURDIR) everywhere then?

We could but I personally find TOPDIR to be clearer: it clearly
identifies the top-level directory of the Buildroot source tree. While
CURDIR could easily be mistaken as something else.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
