From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 00:02:03 +0200
Subject: [Buildroot] [PATCH 0/4 v2] misc graph-depends enhancements
 (branch yem/graph-depends)
In-Reply-To: <cover.1427235377.git.yann.morin.1998@free.fr>
References: <cover.1427235377.git.yann.morin.1998@free.fr>
Message-ID: <20150401000203.0811afe2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 24 Mar 2015 23:16:47 +0100, Yann E. MORIN wrote:
> Hello All!
> 
> This series introduces a few enhancements to graph-depends, with two new
> options:
>   - --stop-on/-s PKG: to stop graphing on package PKG;
>   - --exclude/-x PKG: like --stop-on, but also omit PKG from the graph.
> 
> PKG can be one of an actual package name, a glob or the keyword
> 'virtual' (to stop on / exclude virtual packages). Stoping on, or
> excluding host packages can easily be done by using the glob 'host-*'
> 
> Note: I did not introduce the keyword 'host' because 'host' is an
> existing package, and even though we do not package it so far, it
> would have clashed, should we eventually have it.

Series applied, thanks.

One thing that bothered me a bit is that --stop-on supports the keyword
'virtual', but not --exclude.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
