From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:45:24 +0200
Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
In-Reply-To: <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
References: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
 <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170401184524.460419d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Feb 2017 15:51:08 -0200, Carlos Santos wrote:
> While currently there is no in-tree Buildroot package which depends on
> host-python-lxml, we (DATACOM) have some proprietary modules that use it
> in their test scripts.
> 
> We tested python-lxml as host package and confirmed that it builds and
> works correctly. Someone else might require it, so we are proposing its
> inclusion.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> ---
> Changes v1->v2:
> - Add explicit host package dependencies, as required after commit
>   4bdb067e380e72c3a6cb9c6ccf3791a6cf8661e0 (infra: remove auto
>   derivation of host dependencies).

In the end, I've applied to master, after adding a Config.in.host file
that makes the host package show up in menuconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
