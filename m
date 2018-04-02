From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 16:05:06 +0200
Subject: [Buildroot] [v5 03/11] pkg-{download, generic,
 luarocks}: use existing $($(PKG)_DL_DIR)
In-Reply-To: <20180402130934.19274-3-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 15:09:26 +0200")
References: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
 <20180402130934.19274-3-maxime.hadjinlian@gmail.com>
Message-ID: <87muyln1pp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Let the infrastructure use the already existing variable $(PKG)_DL_DIR
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > v4 -> v5:
 >     - Add missing luarocks infra
 >     - Add few spots in generics that were missed (patch; legal-info)

Committed after fixing up the merge conflicts caused by the autobuilder
fix, thanks.

-- 
Bye, Peter Korsgaard
