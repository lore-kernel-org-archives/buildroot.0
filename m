From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 01 Aug 2007 11:07:37 +0200
Subject: [Buildroot] touch menuconfig
In-Reply-To: <20070801073555.GA4550@firebird.dresden.micronet24.de>
References: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
	<28024.24.217.29.51.1185951980.squirrel@kujawski.org>
	<20070801073555.GA4550@firebird.dresden.micronet24.de>
Message-ID: <1185959257.7207.0.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-08-01 klockan 09:35 +0200 skrev Benjamin Tietz:
> Just to have commandline-completion you dont have to put another silly
> file in the directory confusing/annoying anyone.
> See the section "Programmable Completion" in man 1 bash / your favorite
> shell.
> 
> regards
> Benjamin
> 

OK so you do:

complete -W menuconfig make

Thanks
Ulf
