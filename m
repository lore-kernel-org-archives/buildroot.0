From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 4 Jun 2009 20:05:24 +0200
Subject: [Buildroot] [PATCH 1/2] target/ubifs: fix compilation
In-Reply-To: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
Message-ID: <20090604180524.GB26148@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 03, 2009 at 01:39:04PM +0200, Daniel Mack wrote:
> The ubifs rootfs target does not currently build because the repository
> listed in ubifsroot.mk does not exist anymore. Consequently, the used
> tag is also wrong.

Any oppinion about this one and the follow-up, '2/2'?

Daniel
