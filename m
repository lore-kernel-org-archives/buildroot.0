From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 21:58:57 +0200
Subject: [Buildroot] [PATCH] core/br2-external: export paths and
 descriptions
In-Reply-To: <1476906782-30017-1-git-send-email-yann.morin.1998@free.fr>
References: <1476906782-30017-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161019215857.7ee779d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 21:53:02 +0200, Yann E. MORIN wrote:
> Now that we support multiple br2-external trees, BR2_EXTERNAL is no
> longer exported in the environment.
> 
> This means that post-build scripts in a br2-external tree can no longer
> find their own files (well, they could re-invent the path by stripping
> their known-relative path, but that'd be ugly, especially since we can
> very well provide it).
> 
> Export the path for each br2-external trees as environment variables.
> Do so for the description as well, as a courtesy.
> 
> Also, re-order variable definitions to be more logical: first, purely
> internal variables, then exported variables.
> 
> Reported-by: Beno?t Allard <benoit.allard@greenbone.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Beno?t Allard <benoit.allard@greenbone.net>

Does this require some documentation update?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
