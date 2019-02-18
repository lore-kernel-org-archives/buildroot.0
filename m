From: Artem Senichev <artemsen@gmail.com>
Date: Mon, 18 Feb 2019 11:17:19 +0300
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64le platforms
In-Reply-To: <20190215220144.73a6097b@windsurf.home>
References: <20190213085111.uuar2ehi7k2htdfg@gmail.com>
 <20190215220144.73a6097b@windsurf.home>
Message-ID: <20190218081719.esrkqjaajpj3pvz2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 15, 2019 at 10:01:44PM +0100, Thomas Petazzoni wrote:
> Hello Artem,
> 
> Thanks for the patch.
> 
> On Wed, 13 Feb 2019 11:51:11 +0300
> Artem Senichev <artemsen@gmail.com> wrote:
> 
> > kexec has fully support of ppc64 platform:
> > https://www.kernel.org/doc/Documentation/kdump/kdump.txt
> > 
> > Signed-off-by: Artem Senichev <artemsen@gmail.com>
> > ---
> >  package/kexec/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to next. What about ppc64 big endian, i.e BR2_powerpc64 ?

I have just checked big endian ppc, it looks like kexec works fine.
v2 patch: https://patchwork.ozlabs.org/patch/1043815/

-- 
Regards,
Artem Senichev
