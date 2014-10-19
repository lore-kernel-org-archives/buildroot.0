From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:19:54 +0200
Subject: [Buildroot] [PATCHv2] tar: bump to version 1.28
In-Reply-To: <1413725888-12774-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413725888-12774-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019171954.670fbe8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 19 Oct 2014 10:38:08 -0300, Gustavo Zacarias wrote:
> Also add hash file and set eprefix to / otherwise when busybox is around
> we've got duplicate tar applications (/bin/tar for busybox, /usr/bin/tar
> for full-blown) normally making busybox still win in directory search.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks. I've just made a minor change, see below.

> +# busybox installs in /bin
> +TAR_CONF_OPTS = --exec-prefix=/

I've slightly expanded the comment here to explain why we do that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
