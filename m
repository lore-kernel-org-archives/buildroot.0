From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Oct 2019 10:14:16 +0200
Subject: [Buildroot] semange utility is not getting installed in the
 target from selinux-python package (Requiered for SE-Linux)
In-Reply-To: <560402954.3114391.1571338158717@mail.yahoo.com>
References: <560402954.3114391.1571338158717@mail.yahoo.com>
Message-ID: <20191018101416.20c4b4c7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Oct 2019 18:49:18 +0000 (UTC)
sadasivan shaiju <shaiju_sada@yahoo.com> wrote:

> I have built and installed buildroot  image . But I see that the
> semange  utility is not getting installed .  This utily is included
> in the tar.gz  package . But it is got getting build or installed ?
> Is there any purticular reason why this utility is not included ?

Because nobody needed it so far.

> Can I include it ?  Or is there an alternative tool ?

Yes, you can include it, add an option for it in
package/selinux-python/Config.in, and adjust
package/selinux-python/selinux-python.mk to install it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
