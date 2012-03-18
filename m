From: bifferos <bifferos@yahoo.co.uk>
Date: Sun, 18 Mar 2012 20:54:54 +0000
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <201203181813.30601.arnout@mind.be>
References: <201203031529.36487.arnout@mind.be>
 <201203181450.44385.arnout@mind.be> <4F660977.4040806@yahoo.co.uk>
 <201203181813.30601.arnout@mind.be>
Message-ID: <4F664B9E.7080604@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2012 05:13 PM, Arnout Vandecappelle wrote:
<snip>
>> Now I'm wondering if there is something that has been activated in
>> busybox, some feature, which requires kernel support, and (since my
>> kernel is minimal) perhaps it doesn't have it, and perhaps init doesn't
>> handle the lack of that support gracefully and crashes.  Nothing comes
>> to mind though.
>   Since init segfaults before any instruction is executed, it seems
> unlikely.  The binary formats seem OK as well.  You could try to
> enable CONFIG_BINFMT_AOUT.
>
>   Hang on, I realize something.  CONFIG_BINFMT_MISC wasn't enabled in
> the config I sent, so /init can't be executed (/init is a shell script
> that mounts devtmpfs).  Can you enable BINFMT_MISC and try again?
Ah.  That doesn't work, but it leads me to ask a more basic question:  
What kernel command-line should this system be using? :)

thanks,
Biff.
