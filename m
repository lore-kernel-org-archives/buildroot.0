From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Jun 2019 09:32:12 +0200
Subject: [Buildroot] [PATCH V5 2/2] board/qemu/csky/readme.txt: Add
 C-SKY Qemu run Documentation
In-Reply-To: <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
References: <1559468510-22085-1-git-send-email-guoren@kernel.org>
 <1559468510-22085-2-git-send-email-guoren@kernel.org>
 <20190602134620.77a41eb3@windsurf>
 <CAJF2gTSGEKBE6=EL7PyKvxJ0mF+2wFjXvBxyCZOfFPJ8jVW7hg@mail.gmail.com>
Message-ID: <20190603093212.74f84255@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jun 2019 14:47:09 +0800
Guo Ren <guoren@kernel.org> wrote:

> Qemu upstream is under way and I want to add host-qemu for C-SKY after that.
> 
> See here:
> https://gitlab.com/c-sky/buildroot/tree/master/package/csky-qemu
> I don't use package/qemu to build csky qemu and I add another
> csky-qemu package for simple.

Well, why not simply adding C-SKY support to the existing
package/qemu ? It should be fairly easy, just change the
version/source/site, and that's it ? Since you're in the process of
upstreaming, I assume you're using a recent version of Qemu, so all the
logic in qemu.mk for upstream Qemu should apply to the C-SKY variant as
well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
