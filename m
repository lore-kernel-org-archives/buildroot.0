From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:38:42 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page
 with minimal legal info
In-Reply-To: <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
References: <20191029095101.442578-1-mickael.tansorier@smile.fr>
 <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
Message-ID: <20191031223842.24bfc912@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Oct 2019 23:40:07 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  It is looking pretty good. I just have one major comment: it has to be flake8
> compliant.

During the Buildroot Developers meeting, Nicolas Carrier worked on an
alternate proposal that consists in generating an XML, and then use an
XSLT stylesheet to have the browser render an HTML output:

  http://patchwork.ozlabs.org/patch/1185080/

I am personally not a big fan of XML/XSLT technologies, and we already
have stuff in Buildroot that generates just pure HTML, so I would tend
to prefer an approach such as the one proposed by Micka?l in this
patch. Should we formally reject the proposal from Nicolas ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
