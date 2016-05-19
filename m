From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 23:15:44 +0200
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <20160519160040.1eee27e6@free-electrons.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160519142103.507c1395@free-electrons.com> <573DC2D6.5090003@imgtec.com>
 <20160519160040.1eee27e6@free-electrons.com>
Message-ID: <65c4eb1a-5c6e-39f1-aec1-66857ced57a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/16 16:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 19 May 2016 14:42:46 +0100, Vicente Olivert Riera wrote:
[snip]
>>> > > I think that for such small patches, that are not taken from upstream,
>>> > > my preference is to have them in Buildroot itself rather than
>>> > > downloaded by <pkg>_PATCH.  
>> > 
>> > I remember someone told me that we prefer this method when possible...
>
> Yeah, we don't have a very fixed policy on this. My own thinking is
> that it's fine to use <pkg>_PATCH to fetch patches that are already
> otherwise available (from another distribution or from upstream), but
> when it's done by "us", it's better to have the patch in Buildroot
> itself. But I agree that the line between both solutions is thin.

 I indeed once wrote "we prefer to download patches through FOO_PATCH rather
than including it". I think in that particular case it was a patch from a
different distro. Anyway, I didn't really think it through at the time. I
certainly agree that it should only be for upstream patches, and maybe also
patches from different distros.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
