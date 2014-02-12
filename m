From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 18:32:31 +0100
Subject: [Buildroot] [pkg-perl infra V9 3/6] host-perl-xml-parser:
 rename and refactor with perl infrastructure
In-Reply-To: <1392192871-426-4-git-send-email-francois.perrad@gadz.org>
References: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
 <1392192871-426-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <52FBB02F.5050203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/14 09:14, Francois Perrad wrote:
> Even though libxml-parser-perl had a Config.in file with an option to
> enable it on the target, this option was hidden by a dependency on
> BR2_HOST_ONLY. So in practice, it was not possible to enable
> libxml-parser-perl on the target. This allows us to rename
> libxml-parser-perl to perl-xml-parser to follow the new naming
> convention of Perl packages, without having to introduce
> Config.in.legacy material.
> 
> In addition to this rename, the package is converted to use the newly
> introduced Perl package infrastructure.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Note that this one (and the following one) does not depend on the
scancpan script, so it can go in immediately (in -next).

 Francois, in your next iteration you should probably move patch #6 to
the beginning and patch #2 to the end, so they are sorted in order of
merge priority.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
