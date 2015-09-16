From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 19:38:42 +0200
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
 library
In-Reply-To: <CAOudHSU5sVhW4ono_QprXuyazYjMiHcRzfvW2TNg9qLVZ8R=Bg@mail.gmail.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <CAOudHSU5sVhW4ono_QprXuyazYjMiHcRzfvW2TNg9qLVZ8R=Bg@mail.gmail.com>
Message-ID: <20150916193842.7083a71f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Wed, 16 Sep 2015 13:36:20 -0400, Cjw X wrote:

> I've gotten newlib moved over to the autotools infrastructure. I
> should be able to post updated patches tonight.

Good. However, don't hold your breath. While I think adding newlib
support is interesting in Buildroot, it may not be the opinion of
others.

> > Except the mkdir, the install command is not needed if you use the
> > autotools-package infrastructure.
> 
> So, that mkdir command needs to be run, and the it is most closely
> associated with the staging install.
> Is there some way to run mkdir then without overriding the
> install_staging define? I haven't found anything in the docs.

Search for <pkg>_PRE_INSTALL_STAGING_HOOKS in the documentation, and
generally the concept of hooks. See
http://buildroot.org/downloads/manual/manual.html#hooks.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
