From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 14:35:10 +0100
Subject: [Buildroot] [RFC] moving audio and video packages into a
	new	category 'multimedia'
In-Reply-To: <9DA31EAF-25F4-4EB3-BD8D-4229AD7DE022@valka.is> (Arnar Mar Sig's
	message of "Fri\, 14 Nov 2008 12\:47\:58 +0100")
References: <200811140813.57041.markus.heidelberg@web.de>
	<20081114092706.4e11413d@hcegtvedt>
	<200811141003.19394.markus.heidelberg@web.de>
	<COL102-DS1586696D3AE21579640C10DC160@phx.gbl>
	<9DA31EAF-25F4-4EB3-BD8D-4229AD7DE022@valka.is>
Message-ID: <87skpujur5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnar" == Arnar Mar Sig <antab@valka.is> writes:

 Arnar> I also think that the package dir structure should reflect the menus  
 Arnar> and no packages should be directly under packages/

 Arnar> IMO the organization of package that FreeBSD ports has is really good  
 Arnar> and can be used as template for our package dir structure.
 Arnar> Also FreeBSD ports does NOT rename packages like most linux package  
 Arnar> systems do (and annoys the hell out of me). Like libgtk, the softwares  
 Arnar> name is GTK not libgtk so the package should be named gtk to make  
 Arnar> looking for it easier.

Fine by me, patches are welcome.

I would prefer to not rename Kconfig symbols though, to not break
existing .config's.

-- 
Bye, Peter Korsgaard
