From: fritz huber <FritzHuber_mailinglist@gmx.de>
Date: Wed, 16 May 2007 14:14:28 +0200
Subject: [Buildroot] sshd always wants to change password
In-Reply-To: <20070516115633.GB8387@aon.at>
References: <20070516095957.296670@gmx.net> <20070516110107.GB6566@aon.at>
	<20070516113748.296680@gmx.net> <20070516115633.GB8387@aon.at>
Message-ID: <20070516121428.296670@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Wed, May 16, 2007 at 01:37:48PM +0200, fritz huber wrote:
> >> On Wed, May 16, 2007 at 11:59:57AM +0200, fritz huber wrote:
> >> >Hello
> >> >
> >> >I'm working with buildroot from 2006-04-18 and kernel 2.6.12 on a ARM9
> >> system. Now i have a problem with the ssh deamon. I would like to use
> ssh
> >> with classic login. My problem:
> >> >
> >> >When i would like to login with a non-root user:
> >> >
> >> >sshd at 10.0.0.190's password: 
> >> >WARNING: Your password has expired.
> >> >You must change your password now and login again!
> >> >passwd: This applet requires root priviledges!
> >> >Connection to 10.0.0.190 closed.
> >> 
> >> 1) your password is set to expired, fix the expiration date.
> >> 2) configure busybox according to your needs (suid bits, busybox.conf)
> >
> >
> >Thank you for your answer. 
> >
> >1) When i login on the standard terminal with RS232 it works correct.
> Just with ssh i must change my passwords (doesn't matter witch account). 
> >
> >Here is the entry from my shadow file:
> >sshd:"PASSWORD":0:0:99999:7:::
> 
> set the last changed field to non-null

That was the failure. Thank you for your fast support. Have a nice day.

Best regards
Fritz Huber
-- 
Psssst! Schon vom neuen GMX MultiMessenger geh?rt?
Der kanns mit allen: http://www.gmx.net/de/go/multimessenger
