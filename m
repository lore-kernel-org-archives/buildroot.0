From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Mar 2018 21:45:50 +0100
Subject: [Buildroot] [PATCH 2/2] support/check-bin-arch: exclude kernel
 modules for merged /usr
In-Reply-To: <ce786b49c9bbe6a3e2ebde9ca28b56de86e68b2e.1520454419.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 7 Mar 2018 21:27:19 +0100")
References: <cover.1520454419.git.yann.morin.1998@free.fr>
 <ce786b49c9bbe6a3e2ebde9ca28b56de86e68b2e.1520454419.git.yann.morin.1998@free.fr>
Message-ID: <876067obr5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When using a merged /usr, the kernel module path is really
 > /usr/lib/modules, as /lib is a symlink to usr/lib .

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
