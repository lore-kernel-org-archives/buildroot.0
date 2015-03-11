From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:53:30 +0100
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
	on target
In-Reply-To: <1426092262.2375.11.camel@synopsys.com> (Alexey Brodkin's message
 of "Wed, 11 Mar 2015 16:44:22 +0000")
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
 <877funmrkw.fsf@dell.be.48ers.dk>
 <1426092262.2375.11.camel@synopsys.com>
Message-ID: <87pp8flblh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

>> Any specific reason why you don't just configure a root password and
 >> enable dropbear instead?

 > Well I though of telnet as an essential replacement of serial console
 > especially for development boards.

These days I would say ssh is much more common.

 > So my main intention was to get the most convenient tool for wide range
 > of developers. 

 > For example in Windows if I'm not mistaken Telnet client is available
 > right from MS, while SSH client is always 3rd-party program like Putty. 

If I'm not mistaken Windows no longer comes with telnet out of the box.

E.G. first Google hit:

http://social.technet.microsoft.com/wiki/contents/articles/910.windows-7-enabling-telnet-client.aspx

 > Also ability to not set password is convenient here - because people
 > will ask "what's the password" otherwise. Still in case of devboards we
 > have limited access to the network for foreigners so we may not care
 > much about paranoid safety.

Don't they ask the same about the serial login password?


 > Indeed your proposal may work if my motivation is not convincing enough.

I can still be convinced, but my initial thought is that it isn't
really a common enough use case / we should promote ssh instead.

-- 
Bye, Peter Korsgaard 
