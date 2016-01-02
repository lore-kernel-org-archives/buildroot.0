From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 01:55:40 +0100
Subject: [Buildroot] [PATCH 29/84 RFC] package/tcl: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <647ce3d24f32a353382c1de643fef55f1e336e52.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <647ce3d24f32a353382c1de643fef55f1e336e52.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <5687200C.8080409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Move inclusion of Tcl libraries/modules to Tcl's Config.in so that they
> appear in Tcl's sub-menu.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/Config.in     | 6 ------
>  package/tcl/Config.in | 7 ++++++-
>  2 files changed, 6 insertions(+), 7 deletions(-)



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
