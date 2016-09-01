From: Ottavio Campana <o.campana@videotec.com>
Date: Thu, 1 Sep 2016 12:18:58 +0000
Subject: [Buildroot] Is there an equivalent of yocto's devshell?
In-Reply-To: <20160901113941.36166d9e@free-electrons.com>
References: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
 <87a8fszmq7.fsf@dell.be.48ers.dk>
 <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
 <8b51ea03-6172-ce10-9a80-7caf43952de1@flatmax.org>,
 <20160901113941.36166d9e@free-electrons.com>
Message-ID: <5637116E3E13BE46B0D936BF364783C1F6B4F0@MAIA.sede.videotec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> My feeling is that things like devshell are created because using Yocto
> during development is too painful. Buildroot simply doesn't need
> something like devshell because using the build system during active
> development is perfectly fine. Of course, if you disagree and have some
> concrete examples, we'll be happy to look into this.

Thomas, you are 100%.

The usual situation is you develop a portable program, but then you need to specialize some part that is platform-specify and you need to work on the sources with the cross compiler.

I think I'll echo the environment and then reproduce it when I'll work on the sources.

Thank you

Ottavio
