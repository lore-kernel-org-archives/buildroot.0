From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:00:27 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219150027.72263718@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Nov 2015 17:50:52 +0100, Bernd Kuhls wrote:
> This package only provides a git submodule for the vsxu package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I don't really like the interaction between this package and the vsxu
package, but I don't really have a better proposal to be honest.

Yann, Peter, Arnout, do you have some suggestions on how to handle such
git submodule cases?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
