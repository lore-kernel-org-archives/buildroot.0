From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 11:20:21 +0000
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <54ABC247.9030500@zacarias.com.ar>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
 <54ABC247.9030500@zacarias.com.ar>
Message-ID: <54ABC4F5.9060605@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On 01/06/2015 11:08 AM, Gustavo Zacarias wrote:
> On 01/06/2015 06:07 AM, Vicente Olivert Riera wrote:
> 
>> -Bump version to 1.15
>> -Add a hash file
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Hi.
> Out of curiosity, did you try an allyespackageconfig build with this
> one? Major automake bumps tend to break some autoreconf'ed packages that
> use deprecated features.
> Regards.
> 

No, I have only tried to compile those packages depending on
"host-automake": freetype, sdl, gpm and znc, if I recall correctly. Is
not enough? I can do an allyespackageconfig if you require it.

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
