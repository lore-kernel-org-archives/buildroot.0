From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 30 Nov 2014 22:44:58 +0100
Subject: [Buildroot] buildroot 2014.11-rc3 mono fails
In-Reply-To: <1937789234.449812.1417281912237.JavaMail.open-xchange@oxbaltgw09.schlund.de>
References: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
 <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
 <20141128223454.4a2cf327@free-electrons.com>
 <CA+TH9Vn33sHoT3hju_mAMBDDJLfz5w7EVgutJrzPvTW=Wsti9A@mail.gmail.com>
 <1937789234.449812.1417281912237.JavaMail.open-xchange@oxbaltgw09.schlund.de>
Message-ID: <CA+TH9Vk-MrxE3oO3rBnQFb=zUFY3m3VJnM+FvrN8AypTJnWr-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rainer Berns,

I just sent a patch here http://patchwork.ozlabs.org/patch/416269/,
this should solve definitively the problem in a clean way. Let me know
if it works like expected!

Sincerely, Angelo.

2014-11-29 18:25 GMT+01:00 Rainer Berns <rainer.berns@berns-online.de>:
> HI,
>
> removing of the external mono enviroment in ubuntu "fixes" the problem.
> After using the latest git version with the  patch "force host-mono to use
> internal mono bootstrap compiler "and reinstalled mono envirmoment  the
> following error occured:
>
> Mono.Http/NtlmClient.cs(99,26): error CS1502: The best overloaded method
> match for `Mono.Security.Protocol.Ntlm.Type3Message.Type3Message(byte[])'
> has some invalid arguments
> /usr/lib/mono/2.0/Mono.Security.dll (Location of the symbol related to
> previous error)
> Mono.Http/NtlmClient.cs(99,44): error CS1503: Argument `#1' cannot convert
> `Mono.Security.Protocol.Ntlm.Type2Message' expression to type `byte[]'
>
> Regards
> Rainer
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
