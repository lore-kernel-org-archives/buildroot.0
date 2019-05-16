From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 15:27:50 +0200
Subject: [Buildroot] [PATCH] package/cog: install to staging
In-Reply-To: <20190516095858.33732-1-cturner@igalia.com>
References: <20190516095858.33732-1-cturner@igalia.com>
Message-ID: <20190516152750.6badca4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charlie,

On Thu, 16 May 2019 10:58:58 +0100
Charlie Turner <cturner@igalia.com> wrote:

> This is useful when unstripped libraries are installed into staging. It
> allows the cog executable to be debugged.

Missing Signed-off-by line, but an identical patch was already proposed
by Adrian:

  http://patchwork.ozlabs.org/patch/1100157/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
