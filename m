From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 17 Oct 2013 10:40:53 +0200
Subject: [Buildroot] [PATCH 9/9] manual: rework Deploying images chapter
In-Reply-To: <52546B18.7010207@mind.be>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <a2cb1b7caaa580f341abbb3788d18323c3e2e7c3.1381002281.git.s.martin49@gmail.com>
 <52546B18.7010207@mind.be>
Message-ID: <CAHXCMMKzwCJbHJG-zx_7r8LavH0sJT71e12zq3p_J+GFuf8fqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


2013/10/8 Arnout Vandecappelle <arnout@mind.be>

> On 10/05/13 21:49, Samuel Martin wrote:
>
>> [...]
>
>  +
>> +[WARNING]
>> +Be careful, *the _board's_ readme files coming within Buildroot are
>> +provided without warranty of any kind*.
>> +They are contributions from Buildroot users, but Buildroot developers
>> +do not ensure their correctness, nor maintain them.
>>
>
>  Is this warning really necessary? Most readme.txt files use removable
> media (or emulation), and the few that do write to flash have warnings
> already. The only exception is the Telit EVK-PRO3, so maybe we should just
> add a warning there.

Well, the few boards we are talking about here are:
- Telit EVK-PRO3
- avnet s6lx9_microboard
- freescale mpc8315erdb
- freescale p1010rdb
For the 2 later, there is a warning about the bootloader in the readme.txt
files,
for the 2 others, it is not so obvious...

Anyway, I don't mind adding the warning in the readme files.
Having it close to the flashing instruction makes sense;
having it in the documentation (as a genreric warning) makes sense too imho.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131017/407e625f/attachment.html>
