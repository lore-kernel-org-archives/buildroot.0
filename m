From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Feb 2020 20:42:54 +0100
Subject: [Buildroot] [PATCH 6/6 v2] boot/optee-os: license files hashes
 only valid for latest version
In-Reply-To: <76db34fbca7b956090aaf4557510cf89a3d2d72c.1580914115.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 5 Feb 2020 15:48:43 +0100")
References: <cover.1580914115.git.yann.morin.1998@free.fr>
 <76db34fbca7b956090aaf4557510cf89a3d2d72c.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <8736bnzem9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We can only know the path to the license files for the known version.
 > For custom, older or newer, versions may change, or may be moved
 > around.

 > So, do for optee-os as was done for other packages in the recent past,
 > and only define the list of license files for the latest version.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Markus Mayer <mmayer@broadcom.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
