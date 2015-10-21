From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:39:58 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20151021223958.5605a589@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, 19 Oct 2015 12:42:09 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Allow building jq as host utility for use in post-build scripts.
> This can be useful to created, edit, merge or even perform syntax checking
> on JSON files.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Since this host package clearly doesn't fall into the "debugging tool,
flashing tool or image preparation tool" category, I'd like to collect
the opinion of a few other developers before applying.

Peter, Arnout, Yann, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
