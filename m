From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jun 2012 14:12:31 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
In-Reply-To: <4FD661B2.7050404@mind.be>
References: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
 <4FD661B2.7050404@mind.be>
Message-ID: <20120612141231.33c4ccb8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 11 Jun 2012 23:22:58 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On 06/04/12 09:26, Kiril Maler wrote:
> > 1. It is more intuitive for a developer configuring a small embedded
> > system to see
> > the sftp-server under dropbear ssh suite:
> 
>   Wouldn't it be even better to add the sftpserver feature to buildroot, reusing the
> openssh implementation?  Or would there be a license issue?

What do you mean exactly? Adding sftpserver as a suboption of openssh?
Something else?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
