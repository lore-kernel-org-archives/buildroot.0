From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 28 Oct 2014 17:23:53 +0000
Subject: [Buildroot] [PATCH] lame: Disable for Aarch64 and MIPS when
 building with debug symbols
In-Reply-To: <544FD003.1080800@zacarias.com.ar>
References: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
 <544FCF49.5010704@zacarias.com.ar> <544FCFAE.3050806@imgtec.com>
 <544FD003.1080800@zacarias.com.ar>
Message-ID: <544FD129.1070402@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 10/28/2014 05:18 PM, Gustavo Zacarias wrote:
> On 10/28/2014 02:17 PM, Vicente Olivert Riera wrote:
>
>> You are right, the dependences should be propagated to those packages. I
>> will respin a new version.
>>
>> My apologies for that.
>
> It's more of an open question, i don't think we want to go dependency
> hell on this.
> We could probably just disable debugging for the particular package on
> the particular conditions i think.
> Regards.

Uhm..., yeah, to be honest that was my first thought when I found what 
was the problem.

I'm fine with that. Let's wait until some other developers say their 
opinion as well.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
