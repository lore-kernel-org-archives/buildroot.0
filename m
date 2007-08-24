From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 24 Aug 2007 10:45:44 -0400
Subject: [Buildroot] buildroot for avr32
References: <00d401c7e655$5d036260$6e00a8c0@JONATHAN>
	<d6cda7730708240659q612e813l134c00d238ca6590@mail.gmail.com>
Message-ID: <00db01c7e65d$733db780$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'll apreciate your reply. I'm in the descision to use one or the other. 
It's not so easy for me to choose one or the other. I like to speed that 
patch are build and added to the buildroot project. The people that work in 
this project are very implicated and active. My knowlede are not too big is 
te construction of rootfs. So i'm not very familliar to all the process. I'm 
more at the linux user level thant developper level.

For the GTK, i have seen some package build for the AVR32. So i'm pretty 
sure this can be done.

http://www.angstrom-distribution.org/repo/?action=details&pnm=gtk%2B

it's the link from where i see it.

hope this help

Jonathan
----- Original Message ----- 
From: "Thiago A. Corr?a" <thiago.correa@gmail.com>
To: "Jonathan Dumaresq" <jdumaresq@cimeq.qc.ca>
Cc: <buildroot@uclibc.org>
Sent: Friday, August 24, 2007 9:59 AM
Subject: Re: [Buildroot] buildroot for avr32


> Hi Jonathan,
>
>   I'm using the svn buildroot with avr32, and I'm running into my
> fair share of issues, so I guess the Atmel snapshot might be a safer
> bet. But I really don't like that they have removed the .svn folders
> from the package, making it a lot harder to get updates from the
> buildroot guys. Well, svn is catching up quite rapidly, and I have
> been able to build what I needed so far. I have never built GTK+
> thought.
>
>   I have recently managed to merge the Atmel snapshot with svn to
> some extent. But I haven't gone thru the resulting patch to sort out
> what should be submitted and what should be discarded.
>
> Cheers,
>    Thiago A. Correa
>
>
> On 8/24/07, Jonathan Dumaresq <jdumaresq@cimeq.qc.ca> wrote:
>>
>>
>> Hi all,
>>
>> I just try to get buildroot (from atmel site) build for the avr32. I 
>> would
>> like to know if i should the latest (from the svn) or use the one from
>> atmel. ?
>>
>> I have also another question. On my rootfs, i will need (if possible) to
>> have a graphics web browser on a NGW100 board connected to an lcd. I have
>> seen some browser build on top of gtk+ library. I would like to know if 
>> this
>> is include in the avr32 port of buildroot ?
>>
>> regards
>>
>> Jonathan Dumaresq
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
> 
