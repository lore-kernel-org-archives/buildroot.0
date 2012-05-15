From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 22:44:36 +0200
Subject: [Buildroot] [PATCH v2] Package downloads: allow restricting to
 primary site only
In-Reply-To: <a5856c332d488da31db2.1337107245@beantl019720>
References: <a5856c332d488da31db2.1337107245@beantl019720>
Message-ID: <4FB2C034.9060503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/15/12 20:40, Thomas De Schampheleire wrote:
> This patch adds a new config option BR2_PRIMARY_SITE_ONLY that, when set,
> restricts package downloads to the specified BR2_PRIMARY_SITE. If the package
> is not present on the primary site, the download fails.
>
> This is useful for project developers who want to ensure that the project can
> be built even if the upstream tarball locations disappear.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
