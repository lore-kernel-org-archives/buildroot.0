From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 09:41:01 +0100
Subject: [Buildroot] [PATCH v2 4/4] linux: remove dirs dependency
In-Reply-To: <5318B267.2020301@mind.be>
References: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
 <1394098949-31981-5-git-send-email-fabio.porcedda@gmail.com>
 <5318B267.2020301@mind.be>
Message-ID: <CAHkwnC92pZoA=8W08scQkre5zDYm1JMCpfWQTa9jTUQzyD_jyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 6, 2014 at 6:37 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/03/14 10:42, Fabio Porcedda wrote:
>> The "dirs" dependency is redundant because now the "generic-package"
>> infrastructure add automatically the "dirs" dependency so just remove
>> the redundant references.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>
>  There are also redundant dependencies on dirs in Makefile and in
> package/uclibc/uclibc.mk - that can be done in a separate patch, but if
> you get around to fixing the other places before this one gets committed
> please do include it.

Hi Arnout,
thanks for reviewing.
I will send a patch to remove the dirs dependency from the other files.

Regards
Fabio Porcedda
