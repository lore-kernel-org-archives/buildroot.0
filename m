From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 16:12:28 +0100
Subject: [Buildroot] [git commit] qextserialport: fix line endings in
 patch 0002
In-Reply-To: <20161126150425.6084a4e3@free-electrons.com>
References: <20161125214131.8C49E80DB5@busybox.osuosl.org>
 <24560a5e-b297-7406-e3ba-e9b1a933922b@mind.be>
 <20161126150425.6084a4e3@free-electrons.com>
Message-ID: <da5cced6-7a2f-07ca-7262-b7bcfc448ab9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-11-16 15:04, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 26 Nov 2016 11:48:57 +0100, Arnout Vandecappelle wrote:
> 
>>  Didn't I warn about this in the commit message?
> 
> Yes, you did. I saw it the first time I looked at the patch, but then
> forgot when actually applying later in the day. Which is why I fixed it
> afterwards.
> 
>>  To avoid this kind of problem in the future, perhaps we should add
>> --ignore-whitespace to our patch calls?
> 
> You mean when applying the patches? Apparently, git am takes a
> --ignore-space-change option, could be worth trying next time.

 No, I mean in apply-patches. This particular case didn't cause an error in
git-am because the patch file didn't exist before.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
