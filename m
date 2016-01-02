From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 01:54:25 +0100
Subject: [Buildroot] [PATCH 27/84 RFC] package/python{,
 3}: move inclusion of external python modules
In-Reply-To: <356c69a5fadbf7e6cdbff04b3d12ba2db5282568.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <356c69a5fadbf7e6cdbff04b3d12ba2db5282568.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56871FC1.5030809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:24, Yann E. MORIN wrote:
> Introduce a Config.ext for external python modules, that both python and
> python include from there respective sub-menus.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/Config.in          | 96 ----------------------------------------------
>  package/python/Config.ext  | 96 ++++++++++++++++++++++++++++++++++++++++++++++
>  package/python/Config.in   |  2 +
>  package/python3/Config.ext |  1 +
>  package/python3/Config.in  |  2 +
>  5 files changed, 101 insertions(+), 96 deletions(-)
>  create mode 100644 package/python/Config.ext
>  create mode 120000 package/python3/Config.ext
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
