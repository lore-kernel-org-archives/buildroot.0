From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:21:27 +0200
Subject: [Buildroot] [PATCHv3 1/5] Makefile: remove the graphs/ dir on
 'make clean'
In-Reply-To: <1423171200-24583-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423171200-24583-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150403142127.45151675@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 Feb 2015 22:19:56 +0100, Thomas Petazzoni wrote:
> Currently, a 'make clean' leaves the graphs/ subdirectory in the
> output directory. This commit defines a GRAPHS_DIR variable, used by
> the different graph-generating targets, and which gets cleaned up in
> the 'clean' target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As suggested by Yann, I've changed the patch to use GRAPHS_DIR in
various other places to replace $(O)/graphs, and applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
