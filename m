From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2019 09:09:24 +0200
Subject: [Buildroot] [RFC 1/1] br2-external: Alow to include toolchain
 from external tree
In-Reply-To: <20190421175343.GD21166@scaer>
References: <20190417204630.18746-1-vadim4j@gmail.com>
 <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be> <20190418145344.GA21166@scaer>
 <20190419030101.cktcloq4rfqyw3mt@vkochan-ThinkPad-T470p>
 <bc9c8aa1-9c56-7c86-9b3f-2cd66a91f796@mind.be> <20190420205404.GC21166@scaer>
 <cacfd25b-8a0e-dfe0-185b-2cff5b0d473c@mind.be> <20190421175343.GD21166@scaer>
Message-ID: <9f648675-a652-b571-173f-37f306b6b677@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/04/2019 19:53, Yann E. MORIN wrote:
>> - For the removal of prepare-kconfig, maybe mention that it reverts
>> 9429e7b698638399ecfd73aa37545594f253a074
> I see reverts as a way to state "this was incorrect, so we undo it", and
> this is definitely not the case here; this is technically not a revert.

 Refering to the original commit makes it easy to see that the only reason why
this was introduced in the first place was for this particular creation of the
.br2-external.in file.

 Regards,
 Arnout
