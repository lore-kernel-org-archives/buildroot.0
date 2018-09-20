From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:10:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/strongswan: install libcharon
 vici header
In-Reply-To: <1537456588-17627-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537456588-17627-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920211042.29234e83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 10:16:28 -0500, Matt Weber wrote:
>  - Adds patch to install 'libvici.h' if
>    --with-dev-headers is configured.
> 
> Strongswan  currently installs development headers if
> '--with-dev-headers' is configured, except 'libvici.h'.
> 
> Original discussion and commit:
> https://wiki.strongswan.org/projects/strongswan/repository/revisions/01c2b62362df88a03c53b748bb4e88631410f326

I don't understand: if there is an upstream commit for this that dates
back from 2 years ago, why do we need to have this patch ?

Also you say "discussion", but I don't see any "discussion" at this URL.

And you resubmitted the same patch at
https://lists.strongswan.org/pipermail/dev/2018-September/001932.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
