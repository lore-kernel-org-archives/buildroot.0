From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:48:24 +0200
Subject: [Buildroot] [PATCH] ficl: fix build with gcc 7
In-Reply-To: <20170806105608.24535-1-francois.perrad@gadz.org>
References: <20170806105608.24535-1-francois.perrad@gadz.org>
Message-ID: <91c2ae6b-2d71-7372-4d54-0d9c679ccd96@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-08-17 12:56, Francois Perrad wrote:
> same issue seen with squashfs, gcc7 with -Os remove the code of inline functions.
> 
> see http://autobuild.buildroot.org/results/d72/d72a7e9775a10bc884b9953dd2eba3ad32100cca
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 I extended the commit message a bit and applied to master, thanks. I was first
going to suggest to fix it with a patch instead of with -fgnu89-inline, but then
I saw that upstream has been dead for 7 years...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
