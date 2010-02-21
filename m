From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 21 Feb 2010 22:30:27 +0100
Subject: [Buildroot] [PATCH 11/16] package infrastructure: add
 LD_LIBRARY_PATH
In-Reply-To: <14420c94fda9f27c457b671f0da2a278cba23ac6.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<14420c94fda9f27c457b671f0da2a278cba23ac6.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1266787827.25727.1.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 20 f?vrier 2010 ? 19:43 +0100, Thomas Petazzoni a ?crit :
> During the compilation of target packages, host tools might be used,
> and in turn, they might use host libraries installed in
> $(HOST_DIR)/usr/lib. Therefore, we pass a LD_LIBRARY_PATH variable
> when building packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>
