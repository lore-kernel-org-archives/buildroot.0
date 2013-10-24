From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Oct 2013 15:34:42 +0200
Subject: [Buildroot] [PATCH] Rename netkitbase and netkittelnet
In-Reply-To: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
References: <1382604917-7742-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <20131024153442.56a9157d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud Aujon,

On Thu, 24 Oct 2013 10:55:17 +0200, Arnaud Aujon wrote:
> Rename netkitbase and netkittelnet according to naming policy.
> Updates package/Config.in and busybox.mk accordingly.
> 
> Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>

Both of these packages have been marked deprecated since almost a year
(November 2013). See 442765fe3d8767956eb26d4bcbaa62ce1e1782ca and
5a457ff6cc3129af97f2fdcaa5f88bd5ff02b500.

So many it's simpler better to remove them completely?

Because what your patch is missing is that it's renaming the Config.in
options for those two packages, but it's not adding the necessary
compatibility informations in Config.in.legacy. And I don't think it's
really worth doing that for packages that have been deprecated a year
ago. What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
