From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:29:27 +0100
Subject: [Buildroot] [PATCH] chrony: bump version to 2.4.1
In-Reply-To: <20161205200702.4345-1-peter@korsgaard.com>
References: <20161205200702.4345-1-peter@korsgaard.com>
Message-ID: <20161205212927.26eacca4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Dec 2016 21:07:02 +0100, Peter Korsgaard wrote:
> Fixes a crash issue with smoothtime directive.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/chrony/chrony.hash | 6 +++---
>  package/chrony/chrony.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
