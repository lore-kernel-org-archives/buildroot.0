From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 13 Feb 2017 16:28:06 +0100
Subject: [Buildroot] Shell scripts does not emit finished() to QProcess
In-Reply-To: <1486997512738-156891.post@n4.nabble.com>
References: <1486997512738-156891.post@n4.nabble.com>
Message-ID: <ce6994a6-76f7-a075-51b6-e80dc306cdd8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Logi,

sounds interesting, i never experienced anything similar.
Could you pls post a short example code which can reproduce the problem?

In the meantime you can also try to debug the issue with strace -f , it
might shed more light.

Zoltan Gyarmati
https://zgyarmati.de

On 02/13/2017 03:51 PM, LogiSch17 wrote:
> Hi guys,
> Since I updated to 2016.11 i don?t get any exit messages from shell scripts
> when i execute them from my Qt Programm via QProcess. But the scripts has
> been executed.
>
> Also
> process->waitForFinished(); 
> does only wait its default 30000msecs.
>
> In my test script i am only have on mkdir like:
>
> #!/bin/sh
> mkdir /usr/test
> exit 0
>  
> I am also connected to errorOccurred(), but i don?t get any errors. 
>
> When i am testing my code on my arch desktop everything works fine.
>
> Does anyone have the same problem?
> Or can anyone test this at the newest buildroot version?
> I would be very grateful for helping.
>
> Greetings
> Logi
>
>
>
>
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Shell-scripts-does-not-emit-finished-to-QProcess-tp156891.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170213/11eeb8b2/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170213/11eeb8b2/attachment.asc>
