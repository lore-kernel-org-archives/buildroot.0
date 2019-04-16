From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 22:11:10 +0200
Subject: [Buildroot] [RFC 1/1] toolchain-external/Config.in: Allow to
 select custom external-toolchain package
In-Reply-To: <20190416060110.d55fk33dloukl5tx@vkochan-ThinkPad-T470p>
References: <20190414212654.14910-1-vadim4j@gmail.com>
 <f0ea00e5-8b75-807d-a1cd-245cd3bd080d@mind.be>
 <20190415085724.0528c3f7@windsurf>
 <ba3c32a6-d28a-bbb1-6ea5-b12136599f5a@mind.be> <20190415171509.GR2539@scaer>
 <20190416060110.d55fk33dloukl5tx@vkochan-ThinkPad-T470p>
Message-ID: <aa4b15a1-61b5-f01f-77a6-7a4e1fa1d78d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2019 08:01, Vadim Kochan wrote:
> So, the solution with aggregation external tree toolchains into
> .br2-external.in.toolchain and then include it into
> toolchain/toolchain-external/Config.in looks good, and it is worth to try to
> implement ?

 We all seem to agree that that is the only way to do it, indeed.

 In my earlier mail I said it would be $BR2_EXTERNAL_FOO/toolchain/Config.in
that would get included in there, but it should actually be
$BR2_EXTERNAL_FOO/toolchain-external/Config.in

 Make sure that you post an RFC pretty early so we can check if we all really
agree on the direction.

 Regards,
 Arnout
