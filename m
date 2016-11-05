From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Nov 2016 01:03:52 +0100
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <CAOMZO5DsdPO=S1zqEpLyaiDuexxMFKNiLnw0AHdhxauOVhvisw@mail.gmail.com>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <CAOMZO5AjUAJqMuny_xn3OHEhdvtiZwkAQB-zJcZDvFr+z=LVTA@mail.gmail.com>
 <20161104212727.GB3766@free.fr>
 <CAOMZO5DsdPO=S1zqEpLyaiDuexxMFKNiLnw0AHdhxauOVhvisw@mail.gmail.com>
Message-ID: <ec60c195-84c4-7ef8-860e-6352bd8cc8af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-16 00:50, Fabio Estevam wrote:
> Hi Yann,
> 
> On Fri, Nov 4, 2016 at 7:27 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> 
>> We've recently switched to using pseudo instead of fakeroot (in an
>> attempt to solve #9286). But this is causing more problems.
>>
>> We're investigating a solution, but it's not trivial.
>>
>> In the meantime, you can try reverting ade91bc and 3cd88f1 (which we may
>> end up doing if we can't find a solution quickly).
> 
> Are these commit IDs correct? They don't seem to exist in my tree:
> 
> git show ade91bc
> fatal: ambiguous argument 'ade91bc': unknown revision or path not in
> the working tree.

 Don't worry, I'm sending a patch...

 Regards,
 Arnout

> 
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
