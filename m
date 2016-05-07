From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 23:04:25 +0200
Subject: [Buildroot] [PATCH 09/34] reproducibility/libglib2: allow
 removing codegen
In-Reply-To: <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <88864677-f612-bd6b-3158-5c2980bb9825@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/16 09:49, Gilles Chanteperdrix wrote:
> But this is not sufficient, compiling the python bytecode with the
> same interpreter in different environments yields different binaries,

  Er, this is worrisome... You are saying that we don't have a chance in hell of 
generating reproducible python bytecode?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
