From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 11:02:03 +0200
Subject: [Buildroot] [PATCH] graph-depends: ignore the
 'target-purgelocales' target (v2)
In-Reply-To: <1368693964-5410-1-git-send-email-danomimanchego123@gmail.com>
References: <1368693964-5410-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20130516110203.7be15bdc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 16 May 2013 04:46:04 -0400, Danomi Manchego wrote:
> Otherwise, graph-depends tries to call 'make target-purgelocales-show-depends',
> which does not exist, as 'target-purgelocales' is not an actual package.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> ---
> v2: Fix misspelling in commit log

And this one cannot be applied, because you added (v2) in the title of
the commit. The v2 should be in the [PATCH v2], so that it get
discarded by git.

 git send-email --subject-prefix="PATCH v2" HEAD^

You can also use --subject-prefix with git format-patch if you
separately format your patches and send them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
