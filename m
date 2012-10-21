From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 23:10:34 +0200
Subject: [Buildroot] Selecting custom skeleton hides terminal
	settingsWhy ?
In-Reply-To: <ECFD4F3FAD0A470AB0295E623FA9C18B@JohanW7> (Sagaert Johan's
 message of "Sun, 21 Oct 2012 22:40:12 +0200")
References: <63446FE4CD66446495AD2CCBD689DCB9@JohanW7>
 <87y5izr2iq.fsf@macbook.be.48ers.dk>
 <ECFD4F3FAD0A470AB0295E623FA9C18B@JohanW7>
Message-ID: <87bofvr0ol.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi Peter ;

 Sagaert> I will try to make a patch so when a custom skeleton is
 Sagaert> selected you get a choice whether you would like to configure
 Sagaert> the console
 Sagaert> yes/no ?
 Sagaert> Could you agree with that ?

No, when you select a custom skeleton you have full freedom, but you're
also on your own.

Why don't you just set the correct terminal setting in your custom
inittab?

-- 
Bye, Peter Korsgaard
