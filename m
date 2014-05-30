From: Andrew Ruder <andy@aeruder.net>
Date: Fri, 30 May 2014 20:31:30 +0200
Subject: [Buildroot] [PATCH 0/3] Speed-up gettext and host-gettext build
In-Reply-To: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140530183130.GA18077@og3k>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 29, 2014 at 12:40:25PM +0200, Thomas Petazzoni wrote:
> It would be nice if a few other people could test these changes in
> their own configuration, to confirm that they don't break anything.

Tested-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Cuts my build of host-gettext from ~115 seconds to ~55 seconds.

Thanks,
Andy
