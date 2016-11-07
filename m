From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Nov 2016 22:34:12 +0100
Subject: [Buildroot] [PATCH v4 03/22] toolchain-external: move parts to
 pkg-toolchain-external.mk
In-Reply-To: <20161107012017.22505-4-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-4-arnout@mind.be>
Message-ID: <516212a7-2a5d-72a7-8a3a-7e3c774e60b1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 07/11/2016 ? 02:19, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> pkg-toolchain-external.mk will be used later to define the
> toolchain-external-package infra. Most of the variable and macro
> definitions are shared with the legacy generic-package based
> toolchain-external. Move these to pkg-toolchain-external.mk.
> 
> pkg-toolchain-external.mk is included implicitly by the include
> toolchain/*/*.mk in the top-level Makefile. The order of inclusion is
> not defined, but that doesn't matter because none of the variables
> defined in pkg-toolchain-external.mk are used in conditions or in
> rules in toolchain-external.mk, only in recursively-expanded
> variables.
> 
> No functional changes at all. The output of 'make -qp' hasn't changed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [Arnout: split off into separate patch]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
