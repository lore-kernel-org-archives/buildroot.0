From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:49:27 +0200
Subject: [Buildroot] [PATCH v3 6/9] python-pygame: bump version to fix
 Python 3 byte-compilation issue
In-Reply-To: <CAHXCMM+F8XzmFgz4RQax8yr+E9-4hcmUtRf7O0NN7AkOJrj=9w@mail.gmail.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMM+F8XzmFgz4RQax8yr+E9-4hcmUtRf7O0NN7AkOJrj=9w@mail.gmail.com>
Message-ID: <20160501234927.0939f156@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 1 May 2016 23:22:27 +0200, Samuel Martin wrote:

> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Thanks!


> > +define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
> > +       $(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
> > +endef  
> Note that in version f0bb4a4b365d, _freetype stuff was already there
> but disable.
> (see https://bitbucket.org/pygame/pygame/commits/0a3be7313aa4)

Ah, I didn't notice that. Which reminds me I should explain in the
commit log why I'm adding this.

Thanks for the review,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
