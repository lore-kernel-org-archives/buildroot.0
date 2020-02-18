From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 13:38:29 +0100
Subject: [Buildroot] [PATCH] package/owfs: fixup Python sysconfigdata
 for per-package directories
In-Reply-To: <7bf974a2-e1cb-4c34-2ad0-f0ac83d7279d@mind.be>
References: <20200217235523.107701-1-thomas.petazzoni@bootlin.com>
 <7bf974a2-e1cb-4c34-2ad0-f0ac83d7279d@mind.be>
Message-ID: <20200218133829.78d5dfef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 18 Feb 2020 09:42:25 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Why is this needed for owfs and not for all the other python packages?

Well:

  https://patchwork.ozlabs.org/patch/1239695/

is doing exactly the same thing in the python-package infra for all
other Python packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
