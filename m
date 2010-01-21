From: Clement.FOUCHER at unice.fr <Clement.FOUCHER@unice.fr>
Date: Thu, 21 Jan 2010 17:21:29 +0100
Subject: [Buildroot] Buildroot for powerpc, no prompt + OpenSSH login
In-Reply-To: <4B587959.60804@arcor.de>
References: <79757207E1944D98BC351422003B9ECF@gentiane>
	<20100121144349.GZ8970@buzzloop.caiaq.de>
	<8798648820214450AE9B59CC54232F14@gentiane>
	<4B587959.60804@arcor.de>
Message-ID: <1264090889.4b587f0955a24@webmail.unice.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your help. I'll define a user with a password.

Selon Sebastian <bastisoft@arcor.de>:

> Hello,
> 
> as far as I know SSH logins are not allowed unless there is a password 
> set. To not show the attacker that there is no password, the prompt is 
> still shown.
> 
> To connect through SSH, you need to set a password (passwd). Then it 
> should work. Preferably use another user and "su" to do administration.
> 
> Hope this helps,
> 
> Sebastian
> 
> > My bad ! I checked "generic serial port config", but forgot to select 
> > "ttyUL0" ;-P...
> > Thank you for your help.
> > 
> > Anyway, my second problem still doesn't work, can you help me with that?
> > I re-explain here:
> > 
> > When I try the to connect to the OpenSSH of my card, it does ask me for 
> > a password.
> > But root user doesn't have a password, I can login without it.
> > 
> > How to do? Should I connect with a different user? Is there a default 
> > password for SSH?
> > 
> > Thank you.
> > 
> 
