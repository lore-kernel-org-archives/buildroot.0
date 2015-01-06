From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 13:55:07 +0000
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <54ABE7BA.4060005@zacarias.com.ar>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>	<54ABC247.9030500@zacarias.com.ar>
 <20150106144530.6571a518@free-electrons.com>
 <54ABE7BA.4060005@zacarias.com.ar>
Message-ID: <54ABE93B.3080506@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and Gustavo,

On 01/06/2015 01:48 PM, Gustavo Zacarias wrote:
> On 01/06/2015 10:45 AM, Thomas Petazzoni wrote:
> 
>> When I saw Vicente's patch, I quickly skimmed through the release notes
>> of automake 1.15, and I didn't see anything too scary. I think we could
>> apply and let the autobuilders tell us if anything breaks.
>>
>> But indeed, a little bit of additional testing would be good.
> 
> The autobuilders are currently giving pretty good results so it wouldn't
> really be adding fuel to the fire.
> Anecdotic evidence from my previous major bumps it was mostly a handful
> of packages that needed fixing/bumping.
> Regards.
> 

just for your information, I'm doing an allyespackageconfig build using
the new automake-1.15 and there are more than 200 packages built so far.
It seems that is working pretty well. Fingers crossed :)

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
