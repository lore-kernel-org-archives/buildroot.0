From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:55:34 +0100
Subject: [Buildroot] [PATCH] package/mesa-demo: remove duplicate osmesa
 option
In-Reply-To: <20180212235112.GB20345@momiji>
References: <20180212215931.6105-1-audrey.motheron@gmail.com>
 <20180212235112.GB20345@momiji>
Message-ID: <20180213225534.54b4dfce@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 23:51:12 +0000, Adrian Perez de Castro wrote:
> Hello,
> 
> Thanks for the patch, indeed the option was being duplicated! Just one small
> comment: usually the commit summary line has only the package name, without
> the ?package/? prefix, and in this case the package name is ?mesa-demos?,

Actually the package name is mesa3d-demos :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
