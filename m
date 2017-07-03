From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 22:58:30 +0200
Subject: [Buildroot] [PATCH] uftrace: new package
In-Reply-To: <0d61249c-aa82-f9c7-8b38-7d012d20a9b8@bergerie>
References: <20170625193743.8424-1-vincent.stehle@laposte.net>
 <a744ab11-02b0-6ed6-c975-b3816ca3bf50@smile.fr>
 <0d61249c-aa82-f9c7-8b38-7d012d20a9b8@bergerie>
Message-ID: <25b193a3-e21b-a416-8309-154a7935e254@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 22:47, Vincent Stehl? wrote:
> Well some of the environment settings and configure options are
> "sampled" by this configure script of theirs (which resembles autoconf
> and is not). This ends up being stored in a file, which is reused
> afterwards.

 Please keep this explanation either in the commit log or in a comment in the
.mk file itself, otherwise people will ask the same question again.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
