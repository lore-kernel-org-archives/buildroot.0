From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 08:07:26 +0100
Subject: [Buildroot] [pkg-perl infra V5 1/8] host-perl: refactor and
 rename PERL5LIB
In-Reply-To: <1391763337-30660-2-git-send-email-francois.perrad@gadz.org>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
 <1391763337-30660-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <52F87AAE.5090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/14 09:55, Francois Perrad wrote:
> The official Perl documentation refers only to PERL5LIB.
> PERLLIB is obsolete, we don't need to be compatible with Perl4.
> 
> HOST_INTLTOOL_CONF_OPT is useless because HOST_CONFIGURE_OPTS already contains PERL5LIB.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
