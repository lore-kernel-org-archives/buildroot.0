From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Sep 2015 01:22:06 +0200
Subject: [Buildroot] [PATCH] pkg-generic: fix <pkg>-legal-info target
In-Reply-To: <55E8C75B.5080008@lucaceresoli.net>
References: <217433bd5ec057444b036dd8b72778f078f0926e.1441213919.git.baruch@tkos.co.il>
 <55E85556.4030103@lucaceresoli.net> <20150903143043.GJ18583@tarshish>
 <55E8C75B.5080008@lucaceresoli.net>
Message-ID: <55E8D61E.705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-09-15 00:19, Luca Ceresoli wrote:
> First, why do we have <pkg>-legal-info in 'make help' at all?
> 
> Arnout, you wrote that line in the help text, after a discussion IIRC.
> Do you remember a good reason _not_ to remove it?

 I mostly took over what Thomas had put in
http://patchwork.ozlabs.org/patch/433692

 So no, I see no reason to document <pkg>-legal-info.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
