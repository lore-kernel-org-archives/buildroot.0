From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:07:27 +0200
Subject: [Buildroot] [PATCH 4/5] gdb: add dependency on host-flex and
 host-bison for Git versions
In-Reply-To: <79dbff1d-b31f-8bf9-143b-0e1d17de2127@gmail.com>
References: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1467712019-24632-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <79dbff1d-b31f-8bf9-143b-0e1d17de2127@gmail.com>
Message-ID: <20160705150727.43c2ba73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jul 2016 13:32:24 +0200, Romain Naour wrote:

> Le 05/07/2016 ? 11:46, Thomas Petazzoni a ?crit :
> > gdb versions fetched from git (such as the ARC version) will not build
> > with host-flex and host-bison.  
> 
> I'm wondering why host-flex and host-bison was not already present in gdb
> dependency when fetched from git.

I'm not sure either, but clearly gdb failed to build without
host-flex/host-bison available, when gdb was coming from Git.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
