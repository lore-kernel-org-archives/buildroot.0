From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 17:45:23 +0200
Subject: [Buildroot] [PATCH 3/8] pkg-download: support new subdir for
 mirrors
In-Reply-To: <20180402145802.17611-3-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 16:57:57 +0200")
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
 <20180402145802.17611-3-maxime.hadjinlian@gmail.com>
Message-ID: <871sfxmx2k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Since we introduced subdirectory to the DL_DIR, we need to support them
 > in the PRIMARY and BACKUP mirror as they evolve to the new tree
 > structure.

 > We check first the new URI (with the subdir), and in case of failure, we
 > go check without.
 > By checking both URIs, we ensure that old mirror are usable.

 > Also, add a missing qstrip call for BR2_BACKUP_SITE.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > v4 -> v5:
 >    - Use new DL_SUBDIR
 >    - Add missing qstrip

Committed, thanks.

-- 
Bye, Peter Korsgaard
