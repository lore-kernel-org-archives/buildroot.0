From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 22 Aug 2012 13:36:35 +0200
Subject: [Buildroot] Compiling process
In-Reply-To: <1345632626.17520.YahooMailNeo@web164605.mail.gq1.yahoo.com>
References: <1345630715.32281.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <5034B3CC.5070804@relinux.de>
 <1345632626.17520.YahooMailNeo@web164605.mail.gq1.yahoo.com>
Message-ID: <5034C443.8020100@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 22.08.2012 12:50, schrieb Zoran Djordjevic:
> Can you tell me, Stephan, what is your developement environment?
> Can I use some ordinary editor to create .c or .cpp file and then
> compile from command line?
> Do I have to write some code in Qt related source to react on -qws
> option ?
For now I only use the example and demo programs included in the QT
distribution (have to be enabled in buildroot xconfig).

For a user application I would create a package according to the
buildroot documentation. Of Course you have to write a QT application;-)

QT has the advantage to be cross-platform, so you should be able to
create and test the application on your desktop (e.g. with qt designer)
and compile it afterwards within buildroot.

Regards

Stephan
 
> Thanks
>
> *From:* Stephan Hoffmann <sho@relinux.de>
> *To:* buildroot at busybox.net
> *Sent:* Wednesday, August 22, 2012 12:26 PM
> *Subject:* Re: [Buildroot] Compiling process
>
> Am 22.08.2012 12:18, schrieb Zoran Djordjevic:
>> Hello
>>  
>> Can someone tell me through an example what compiler line
>> should look like for compiling SomeFile.c (or .cpp) using compiler,
>> built by Buildroot.
>> Also, does Qt need building X server, or it run independently of it ?
> Hi,
>
> I am currently working with QT without X. It runs directly on the
> Linux framebuffer.
>> Does some window manager have to be installed ?
> No, but you have to start the app with the "-qws" option.
>
> Kind regards
>
> Stephan
>>  
>> Best regards
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net <mailto:buildroot@busybox.net>
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> -- 
> reLinux     -    Stephan Hoffmann
> Am Schmidtgrund 124    50765 K?ln
> Tel. +49.221.95595-19    Fax: -64
> http://www.relinux.de/     sho at reLinux.de <mailto:sho@reLinux.de>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net <mailto:buildroot@busybox.net>
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120822/ba28cc31/attachment.html>
