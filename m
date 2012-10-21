From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 21 Oct 2012 22:40:12 +0200
Subject: [Buildroot] Selecting custom skeleton hides terminal
	settingsWhy ?
In-Reply-To: <87y5izr2iq.fsf@macbook.be.48ers.dk>
References: <63446FE4CD66446495AD2CCBD689DCB9@JohanW7>
 <87y5izr2iq.fsf@macbook.be.48ers.dk>
Message-ID: <ECFD4F3FAD0A470AB0295E623FA9C18B@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Peter ;

I will try to make a patch so when a custom skeleton is selected you get a choice whether you would like to configure the console
yes/no ?
Could you agree with that ?

Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: zondag 21 oktober 2012 22:31
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] Selecting custom skeleton hides terminal settingsWhy ?

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> (2012.11 git)
 
 Sagaert> When i select a custom skeleton the settings for the login  Sagaert> prompt (ttyxxx) and baudrate are hidden .

 Sagaert> Can someone explain why this was altered this way ?

Because it relies on a specific syntax in the default /etc/inittab, that might not be present if you use a custom skeleton (perhaps
you don't even have an inittab).

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
