From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Jan 2014 10:09:34 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
	unit
In-Reply-To: <20140129082612.GM3867@lukather> (Maxime Ripard's message of
 "Wed, 29 Jan 2014 09:26:12 +0100")
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
 <20140103201333.7f4edd47@skate>
 <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
 <52E7589F.7060301@mind.be>
 <CAGduivw+HOQRDN18=xrM_AwqT3YtoM7BwmcaNRDb0VFVaQM9eQ@mail.gmail.com>
 <20140128132058.GD3867@lukather> <52E7E6D4.1020501@mind.be>
 <20140129082612.GM3867@lukather>
Message-ID: <871tzrxigh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 >> Also, as far as I understand, the idea is not to add variables, but
 >> rather to check for the existence of package/foo/*.service and
 >> install that.

 > This also doesn't cover the case anymore where a package would ship
 > together with the source code a systemd unit file. I expect it to be
 > more and more common, and it's something that we will want to use most
 > of the time, and not duplicate the unit file in the buildroot package
 > itself.

Good point. I would certainly not want us to write our own service files
if upstream provides a workable one.

-- 
Bye, Peter Korsgaard
