From: Mats Erik Andersson <mats.andersson64@comhem.se>
Date: Sat, 02 Jun 2007 12:16:49 +0200
Subject: [Buildroot] Bluetooth for build-root
In-Reply-To: <46613906.3040802@teamboyce.co.uk>
References: <46613906.3040802@teamboyce.co.uk>
Message-ID: <1180779409.13390.5.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-06-02 klockan 10:31 +0100 skrev Rod Boyce:
> All,
> 
> I am about to start looking at Bluetooth packages for build-root is any 
> body else looking at this?  If so perhaps we can coordinate our 
> activities? 
> I will be working with a USB 2.0 EDR Bluetooth dongle and my kernel 
> currently recognizes it so now I have to get the user side stuff 
> working.  I want to implement A2DP, SCO (Audio gateway) multi-phones, 
> file-share, networking and anything else I want in my application as 
> well.  While this is a significant amount of work if anybody it 
> currently working on this I would be very interested in combining our work.

Hello there,

I have created buildroot packages for bluez-libs and bluez-utils
and they are under testing in my project since two weeks. The testing
is mainly a matter of tweeking the settings, since the library and
executables integrate well on my target system. To be honest, I am also
gleaning on other package implementations before I dare to make my own
public!


Best regards,    Mats Erik Andersson
