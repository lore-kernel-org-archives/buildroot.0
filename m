From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:32:39 +0200
Subject: [Buildroot] [PATCH 4/5 v2] package/acl: bump version
In-Reply-To: <301ec6ce94e85f26041c1d2855ff315bddb58cde.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <301ec6ce94e85f26041c1d2855ff315bddb58cde.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <ffd2080b-dab0-8766-7997-89c412edd35e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-18 16:21, Yann E. MORIN wrote:
> Of most interest is the build system overhaul, and the drop of the
> dependency on attr-provided <attr/xattr.h> in favour of the
> system-provided <sys/xattr.h>.
> 
> That last bit meaning that we will be able to bump attr.
> 
> We can drop our patches: static is now natively supported thanks to
> the use of libtool, and the internal symbols patch was a backport,
> and finally, our install patch is superseded by the use of autotools.
> 
> The option to disable NLS has changed, so update accordingly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>


 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
