From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 10 Jan 2014 11:28:07 +0100
Subject: [Buildroot] [PATCH v10 1/8] package: add base dependency to
	every package
In-Reply-To: <52CEDCB9.9090102@mind.be>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-2-git-send-email-fabio.porcedda@gmail.com>
 <52CEDCB9.9090102@mind.be>
Message-ID: <CAHkwnC-YNyRMgLfmF6x3kXRbG63Rtg5xH7kFR-Oazu=k__EKfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 9, 2014 at 6:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/12/13 11:36, Fabio Porcedda wrote:
>>
>> Move "dependencies" "dirs" "prepare" dependencies from "toolchain" to
>> every package.
>> This way we can build correctly every package right after the clean
>> stage.
>> As example with this commit we can build successfully the glibc right
>> after the clean stage:
>>         make clean glibc
>>
>> This is also a step forward supporting top-level parallel make.
>>
>> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>
>
>  Peter,
>
>  This one is fixing a problem reported by a user and has already gone
> through 10 iterations. Can it be committed?

I've sent a rebased version, so now are 11 iterations...

Best regards
-- 
Fabio Porcedda
