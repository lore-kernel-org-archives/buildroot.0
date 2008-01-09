From: Joe <zentrale.at.work@gmail.com>
Date: Wed, 09 Jan 2008 09:29:52 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
In-Reply-To: <008301c85298$5df36d00$7601a8c0@atmel.com>
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN><01ce01c8524a$65be7fa0$080514ac@atmel.com>
	<47847933.2010902@gmail.com>
	<008301c85298$5df36d00$7601a8c0@atmel.com>
Message-ID: <47848600.7060207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The board is currently under heavy development, so i don't want to send 
out stuff that will be obsolete for sure in days or some months at best. 
But we will of course feed our patches back to the community once it's 
done, everythings working fine and looking good :-)

Greetz, Joe

> If you want to have your board supported, then I suggest that you
> provide the patches neccessary.
> 
> Please note that you can easily create your own board support by doing:
> 
> $ make configurated
> then you edit the different configuration files.
> $ make saveconfig
> 
> Your project configuration files are then saved in "local/<project>"
> 
> By making "local" a symbolic link, you can share it between 
> different instances of buildroot.

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at gmail.com

watch out for:
www.rocksociety.de
