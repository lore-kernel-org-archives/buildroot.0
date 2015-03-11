From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 21:45:43 +0100
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <550069E9.5060403@zacarias.com.ar>
References: <550069E9.5060403@zacarias.com.ar>
Message-ID: <20150311214543.597e639b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 11 Mar 2015 13:14:33 -0300, Gustavo Zacarias wrote:

> How about we kill non-lfs and non-ipv6 toolchains?

I fully support this idea.

> It's 2015 after all, and the size delta is minor:
> 
> tar file delta, arm926 uclibc+busybox
> =====================================
> Threading (NPTL)        +153600 bytes

Ah, too bad. I was hoping to also suggest to remove the no-thread
solution. The number of packages that need threads these days is really
enormous, and I'm not really sure in practice how many people are doing
no-thread based systems.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
