From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 09:45:09 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <B8C6A2A4B3B34310B1CCF5E6BF5E22CE@aeglos>
References: <4A689265.6030308@atmel.com> <87skgmwm6h.fsf@macbook.be.48ers.dk>
	<4A69741A.8010903@atmel.com>
	<20090724085603.GL13236@buzzloop.caiaq.de>
	<9E543F22BF68405185D6B77291E4E5EF@aeglos>
	<20090724121641.2c4cf8bd@surf> <4A699CDD.7060703@atmel.com>
	<20090724152448.4d1f5934@surf> <4A69D04E.9040408@atmel.com>
	<20090724224516.15b39e30@surf> <4A6BEE7C.4080308@atmel.com>
	<87r5w3syn7.fsf@macbook.be.48ers.dk> <4A6C242F.8040704@atmel.com>
	<878wibslsk.fsf@macbook.be.48ers.dk> <4A6CBAAC.2060309@atmel.com>
	<522C1DF17AF50042AD8AE87F7887BD3D015DF9ADBA@exch.hq.tensilica.com>
	<B8C6A2A4B3B34310B1CCF5E6BF5E22CE@aeglos>
Message-ID: <20090727094509.4d9a7aa7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Jul 2009 08:40:13 +0200,
"Ulf Samuelsson" <ulf.samuelsson@atmel.com> a ?crit :

> I just want the http://git.uclibc.org/ to report
> 
> ~common/<myproject>
> 
> instead of
> 
> ~/ulf/git/common/<myproject>.
> 
> since the former better illustrates how I'd like to work.

I really don't see the difference between the two approaches, and what
are the advantages of the approach you're proposing. In terms of
visibility, it is *exactly* the same thing.

Honestly, what I understand from this discussion is that you're saying
?I want this to be *this* way and no other way ?, but you're not giving
any strong and convicing arguments of why the current way is bad and
should be changed.

The way we do it in Buildroot is similar to dozens or hundreds of
projects out there. It may be different to dozens or hundreds other
projects. Participating to a community means that making concessions is
necessary to progress and work together.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
