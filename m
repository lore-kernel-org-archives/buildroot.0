From: Andreas Naumann <dev@andin.de>
Date: Thu, 2 Jul 2015 15:57:17 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <1090488407.2399576.1435746536696.JavaMail.root@openwide.fr>
References: <1090488407.2399576.1435746536696.JavaMail.root@openwide.fr>
Message-ID: <5595433D.50705@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Denis,

Am 01.07.2015 um 12:28 schrieb Denis Thulin:

>
> Well, I like having tests as atomic as possible and since the log
> file gives a detailed report of everything including setups and
> teardowns you can find easily why it failed.

Ok, i can see the benefit of having a more detailed report and simpler 
testcases.


>>
>> Btw, what Editor did you use for the creation?
>>
>
> I used Vim with the robotframework plugin.
> Unfortunately, the plugin only does syntax highlighting.

I see. Our vim geek tried that too but finally converted to using RIDE :)

>
> I noticed you used the Operating System library's keyword
> "Run And Return Rc" but I read in the Process Library's documentation
> that using Operating System for running programs was no longer
> recommanded and that functionnality would most likely become
> deprecated. It seems like using Process was the correct way to go.
> See:
> http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
> and
> http://robotframework.org/robotframework/latest/libraries/Process.html

Thanks for pointing that out, I will check and adjust my keywords.


regards,
Andreas
