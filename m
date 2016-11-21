From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Nov 2016 00:22:42 +0100
Subject: [Buildroot] [PATCH next] ser2net: bump version to 3.2
In-Reply-To: <20161121231827.6eaeb62a@free-electrons.com>
References: <20161117163229.3816-1-Vincent.Riera@imgtec.com>
 <20161121231827.6eaeb62a@free-electrons.com>
Message-ID: <b352bc21-63e2-bd19-88bf-ed20290e1daa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 23:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 17 Nov 2016 16:32:29 +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>> Notes to the maintainer:
>>  - ser2net was bumped to 3.1 in master branch (autobuilder fixes) but
>>    not in next branch. This patch will cause a conflict when merging
>>    next into master after the 2016.11 release.
> 
> Noted. Peter, see the above for the record.

 Maybe do a master -> next merge already after the release of -rc3?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
