From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 07:36:53 +0100
Subject: [Buildroot] [pkg-perl infra V8 5/6] manual: adding packages perl
In-Reply-To: <1392139307-29635-6-git-send-email-francois.perrad@gadz.org>
References: <1392139307-29635-1-git-send-email-francois.perrad@gadz.org>
 <1392139307-29635-6-git-send-email-francois.perrad@gadz.org>
Message-ID: <52FB1685.6030409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 18:21, Francois Perrad wrote:
> +Note that:
> +
> + * Setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect (unless
> +   a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined), since
> +   Perl modules generally don't need to be installed to the
> +   +staging+ directory.
> +

 With only one bullet point, the bullet list is pointless. Also I think
the formulation of the explanation is not very clear. I proposed this
alternative in reply to v6:

Note that setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect
unless a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined. The perl
infrastructure doesn't define these commands since Perl modules generally
don't need to be installed to the +staging+ directory.


 Otherwise, looks good to me.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
