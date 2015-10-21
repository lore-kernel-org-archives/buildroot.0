From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Oct 2015 23:04:21 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <20151021223958.5605a589@free-electrons.com>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
 <20151021223958.5605a589@free-electrons.com>
Message-ID: <5627FDD5.8060207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 22:39, Thomas Petazzoni wrote:
> Thomas,
> 
> On Mon, 19 Oct 2015 12:42:09 +0200, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Allow building jq as host utility for use in post-build scripts.
>> This can be useful to created, edit, merge or even perform syntax checking
>> on JSON files.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Since this host package clearly doesn't fall into the "debugging tool,
> flashing tool or image preparation tool" category, I'd like to collect
> the opinion of a few other developers before applying.
> 
> Peter, Arnout, Yann, what do you think?

 I was thinking the same thing when I say the patch, but I don't care enough to
really comment on it. It's a bit similar to packages that depend on some host
preprocessing tool, like flex. But then of course we just have a dependency and
not a Config.in.host.

 OTOH, if we accept this, it kind of opens the doors to support almost
everything as a host package. But maybe there's nothing wrong with that either.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
