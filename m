From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 23 Sep 2013 08:29:08 -0500
Subject: [Buildroot] [PATCH 1 of 2 v2] manual generation: check
	dependencies first
In-Reply-To: <f873d24e7a1146f10791.1379761613@argentina>
References: <patchbomb.1379761612@argentina>
 <f873d24e7a1146f10791.1379761613@argentina>
Message-ID: <OFB4942A27.1BA8AFE3-ON86257BEF.0049DACE-86257BEF.004A1445@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 09/21/2013 
06:06:53 AM:

> To generate the manual, you need a few tools. If these are not present,
> pretty cryptic error messages are given.
> This patch adds a simple check for these dependencies, before attempting 
to
> build the manual.
> 
> Signed-off-by: Thomas De Schampheleire 
<thomas.de.schampheleire@gmail.com>
> 
> ---
> v2:
> - update manual with the list of tools (comment Ryan)
> - add check for dblatex and python-argparse (comment Samuel)
> - check minimal version of asciidoc, using suitable-host-package 
mechanism
> 
Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130923/e484f54b/attachment.html>
