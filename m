From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 22:23:38 +0100
Subject: [Buildroot] [PATCH 1/2] imagemagick: disable documentation
In-Reply-To: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
References: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <53027DDA.6060102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 00:57, Romain Naour wrote:
> There is no options to disable the documentation,
> so remove it directly in Makefile.am
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

 Why is this needed?


 Side-track: perhaps we should add stubs for makeinfo, help2man,
asciidoc, xmlto, docbook2*, ... in $(HOST_DIR)/usr/bin, so we can disable
all documentation in one fell swoop.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
