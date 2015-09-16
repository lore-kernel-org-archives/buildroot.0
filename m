From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 12:36:26 +0200
Subject: [Buildroot] [PATCH v2] Enable vlc to run as root
In-Reply-To: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442391509.git.jpinto@synopsys.com>
References: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442391509.git.jpinto@synopsys.com>
Message-ID: <20150916123626.01f38cbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joao,

Thanks for this new iteration. It looks good, except for one minor nit
that isn't very important, but worth mentioning.

On Wed, 16 Sep 2015 09:26:49 +0100, jpinto wrote:
> From: Joao Pinto <jpinto@synopsys.com>
> 
> A great number of embedded systems only include the root user.
> This patch has the goal of enabling vlc to be ran as root.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> Tested-by: Joao Pinto <jpinto@synopsys.com>

It doesn't make sense to include a Tested-by from you on your patch. We
obviously expect that you have tested your own patch. Tested-by tags
(as well as Acked-by or Reviewed-by tags) are meant to be given by
*other* developers, after testing and/or reviewing your patch.

The other minor nit is that the title of the commit still doesn't match
the Buildroot best practice, which consists in using titles having the
following format:

	<package>: <description>

So in your case, it should be:

	vlc: enable to run as root

Both issues can be fixed by the Buildroot maintainer when he applies
the patch, but I wanted to let you know so you can make things better
for your next contribution!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
