From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Nov 2015 00:27:01 +0100
Subject: [Buildroot] [PATCH v4 0/2] package/unscd: new package
In-Reply-To: <1446823187-7878-1-git-send-email-rdkehn@yahoo.com>
References: <1446823187-7878-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <563D3745.40304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-11-15 16:19, Doug Kehn wrote:
> $(APPLY_PATCHES) suggestion is not incorporated as the debian patches are
> skipped due to 'Unsupported file type for ...' I'm not sure if updating
> apply-patches.sh to handle patches with no extension is the right thing to do.
> Patching the debain series and changing patch names to add .patch extension
> seems like overkill when compared to just handling everything in the .mk.

 Actually it would be good to modify apply-patches to apply everything when it
comes out of a series file.

 Patch follows.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
