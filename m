From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:14:31 +0100
Subject: [Buildroot] [PATCH v2 2/2] python-jinja2: allow build as
 host-package
In-Reply-To: <54C7FE07.4030206@mind.be>
References: <1422293158-26124-1-git-send-email-erico.nunes@datacom.ind.br>
 <1422293158-26124-2-git-send-email-erico.nunes@datacom.ind.br>
 <54C7FE07.4030206@mind.be>
Message-ID: <20150127221431.14835106@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 27 Jan 2015 22:07:19 +0100, Arnout Vandecappelle wrote:

> > While currently there are no in-tree Buildroot packages which depend on
> > host-python-jinja2, I'm currently having to deal with a proprietary
> > software build system that requires it.
> 
>  Forgot to mention in my last review: in that case, you should also add a
> Config.in.host for it (and update package/Config.in.host).

Why ? If it's merely used as a build dependency of another package, I
don't see why we should have a menuconfig entry for it. Indeed, having
a host-python-ninja2 package with no users in-tree is weird, but I
don't think cluttering the "Host utilities" menu with such packages is
the appropriate solution here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
