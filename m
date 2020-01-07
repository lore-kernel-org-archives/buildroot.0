From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jan 2020 21:05:57 +0100
Subject: [Buildroot] [PATCH] package/lvm2: update to version 2.03.05
In-Reply-To: <20200107144512.9133-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Tue, 7 Jan 2020 15:45:12 +0100")
References: <20200107144512.9133-1-p.debruijn@unilogic.nl>
Message-ID: <875zhnjal6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
 > ---
 >  ...configure-Introduce-enable-symvers-option.patch | 278 ---------------------
 >  package/lvm2/lvm2.hash                             |   2 +-
 >  package/lvm2/lvm2.mk                               |   2 +-
 >  3 files changed, 2 insertions(+), 280 deletions(-)
 >  delete mode 100644 package/lvm2/0001-configure-Introduce-enable-symvers-option.patch

 > diff --git a/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch b/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch
 > deleted file mode 100644
 > index 7ef1533..0000000
 > --- a/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch

What happened to this patch? Is the issue with uClibc fixed? Please
mention this in the commit message.

-- 
Bye, Peter Korsgaard
