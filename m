From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:12:23 +0200
Subject: [Buildroot] [PATCH 1/4] vpnc: switch to github as the new site
In-Reply-To: <20160419220400.GI3505@free.fr>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455145392-2355-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160419220400.GI3505@free.fr>
Message-ID: <20160420231223.1a2658a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 00:04:00 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-02-11 00:03 +0100, Thomas Petazzoni spake thusly:
> > The vpnc upstream project has not made any tarball release since many
> > years, but they have continued to update their Subversion
> > repository.
> > 
> > A Github repository synced with the Subversion repository now exists
> > at https://github.com/ndpgroup/vpnc, which is more practical to
> > generate patches and submit pull requests. For this reason, we move to
> > using this Github repository as the new source for the vpnc
> > package. The specific commit that we use corresponds to version 0.5.3
> > exactly.
> > 
> > All patches are re-formatted using Git.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> 70f1211f6f26e87e374d66f9a986e855215b8e3e is indeed 0.5.3
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks, I've applied the patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
