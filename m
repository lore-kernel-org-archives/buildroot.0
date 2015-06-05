From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Jun 2015 00:26:14 +0200
Subject: [Buildroot] [V3] moarvm: new package
In-Reply-To: <1433516541-16421-1-git-send-email-francois.perrad@gadz.org>
References: <1433516541-16421-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <55722206.1040203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/15 17:02, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Hi Francois,

 I've tried building for ARM, and it tries to execute the generated minilua.

 Also, it is possible to use buildroot's libatomic_ops and libuv.

 I'll send an updated patch.

 Regards,
 Arnout



[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
