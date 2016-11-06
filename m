From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 16:42:12 +0100
Subject: [Buildroot] -mcpu=native [was: Re: [autobuild.buildroot.net] Build
 results for 2016-11-05]
In-Reply-To: <20161106150623.2b7fd549@free-electrons.com>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
Message-ID: <3effa23b-8b0b-5be4-04b7-9c7ab18dc768@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-16 15:06, Thomas Petazzoni wrote:
>>          arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/6ec75cc176e05bfc6287dc54fa1a53e0ffc0521d
>> >          arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/86c15acd9a1bc112e4f6566e2e41ca90ed2eb61c
> cc1plus: error: unrecognized argument in option '-mcpu=native'

 Perhaps the toolchain wrapper should detect -mcpu=native and barf. That option
can never lead to any good...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
