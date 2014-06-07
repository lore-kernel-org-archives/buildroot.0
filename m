From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Sat, 7 Jun 2014 11:47:41 +0100 (BST)
Subject: [Buildroot] Patch: qt5webkitexamples
In-Reply-To: <20140607122338.33ab44ce@free-electrons.com>
References: <1402067773.64897.YahooMailNeo@web172303.mail.ir2.yahoo.com>
 <20140607122338.33ab44ce@free-electrons.com>
Message-ID: <1402138061.2503.YahooMailNeo@web172304.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
then I clearly haven't read the whole guidelines in the BR manual. Apologies for that.

I am totally aware that the patch system this project adopted is working since years. Mine was just a suggestion since I work on a daily basis with GitHub and I find it simply splendid for code review.
Maybe it's just my impression but the flow "fork -> patch -> pull request" sounds easier than manual git commands where you have to remember the email address of a mailing list (thus human errors...) and where dozens of emails float around every day even to users not interested in a particular topic.
In my opinion a mailing list should be used only to discuss bugs, ideas and help users. In the current way, users emails risk to get lost into a ton of [PATCH] emails.
Maybe a ML dedicated to patches could help ?

On GitHub users can add inline comments to a patch and you can even share a URL to a specific line of code !

Anyway, I'm not complaining or trying to teach you something. Just sharing my opinion.
I've seen BR is actually on GitHub, but it's 2 months behind the current developments. Is that a "dead" idea or lack of interest/time ?

If you want, I'll try to submit my patch again on monday using git send-email. The patch is very simple, if you can review it as it is it would save me a bit of time and speed things up.

Best regards,
Massimo



>________________________________
> Da: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>A: Massimo Callegari <massimocallegari@yahoo.it> 
>Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
>Inviato: Sabato 7 Giugno 2014 12:23
>Oggetto: Re: [Buildroot] Patch: qt5webkitexamples
> 
>
>Dear Massimo Callegari,
>
>On Fri, 6 Jun 2014 16:16:13 +0100 (BST), Massimo Callegari wrote:
>
>> Hi, attached a patch that adds the missing qt5 webkit examples module.
>
>Thanks for your contribution! However, as Mike Zick said, and as
>explained in the Buildroot manual, patches should be submitted inline.
>The 'git send-email' tool does that for you.
>
>
>
>
>
>> One thing though. Have you ever considered migrating to GitHub ?
>> Submitting patches via email is, in my opinion, extremely inefficient and can lead to human errors.
>
>Which human errors? If you use 'git send-email', there is no problem at
>all, and sending patches just requires one command.
>
>Submitting patches on a mailing list allows people to easily review
>them, discuss comments. Buildroot is by far not the only community to
>do this. Other major communities in the embedded Linux space do the
>same: the kernel, U-Boot, Barebox and others.
>
>Best regards,
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Free Electrons
>Embedded Linux, Kernel and Android engineering
>http://free-electrons.com
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140607/f1f757a2/attachment.html>
