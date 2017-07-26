From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 02:06:17 +0200
Subject: [Buildroot] [PATCH] python-toml: add host variant of the package
In-Reply-To: <CAHQ1cqHcHShsK7YTbXsKS4JP3ueY08mTSRdscKQxALLNmzayVw@mail.gmail.com>
References: <20170725045132.363-1-andrew.smirnov@gmail.com>
 <20170725214647.51f5a3b0@windsurf.home>
 <c6b0876d-b5af-a2d8-a70f-6971c1680bce@mind.be>
 <CAHQ1cqHcHShsK7YTbXsKS4JP3ueY08mTSRdscKQxALLNmzayVw@mail.gmail.com>
Message-ID: <9493c681-b429-552a-9be4-463c77131596@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-17 01:13, Andrey Smirnov wrote:
[snip]
> Anyway, this is a trivial patch for me to carry around, so it's no big
> deal, but if it can be acceptable upstream in any shape or form I'd
> love to get it there.

 In fact, you can even keep this particular one in your BR2_EXTERNAL. Just
create a file package/python-toml/python-toml.mk with just the eval line and it
should work. And of course make sure that that file gets included.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
