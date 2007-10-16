From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 16 Oct 2007 07:39:43 +0200
Subject: [Buildroot] `make source' cannot resume
References: <ed4892840710152000r786d9095sb7af7d14d14957ba@mail.gmail.com>
Message-ID: <004e01c80fb7$22108940$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> hi,
> 
> after the downloading process of `make source' broken by some reasons,
> i then restarted it by reissued the same command.  what i expected is
> that those already downloaded will be skipped, and the `make source'
> continue to download those not yet grabbed.  but the truth is not.
> `make source' restarted the whole download process from the beginning
> and to download everything that has already existed in the `dl'
> directory.
> 
> i know this problem may has something to do with the system i am using
> ( it's cygwin and because i met some problem setting the network of my
> linux box, i have to do the `make source' on cygwin now ).  but i got
> no more clues.
> 

I think we told you to forget cygwin ;-)
If you solve the problem for Cygwin and then test on a Linux
box you can always send in patches...

Best Regards
Ulf Samuelsson
