From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Dec 2016 09:19:48 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: change configuration
 directory
In-Reply-To: <4A1A37A4-9EA0-44A4-89BB-DE3C88C8CADE@gmail.com>
References: <20161128094512.27804-1-damjan.marion@gmail.com>
 <20161130221053.GA3619@free.fr>
 <20161130232712.636daccd@free-electrons.com>
 <62DF7C96-6583-43AE-9AD5-A13DD4A0B49E@gmail.com>
 <20161130234617.19db5f82@free-electrons.com>
 <4A1A37A4-9EA0-44A4-89BB-DE3C88C8CADE@gmail.com>
Message-ID: <20161201091948.1842ae49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 23:52:06 +0100, Damjan Marion wrote:

> > Well a +1 here is not really useful. A patch or at least initial
> > investigation of the feasibility would be a lot more useful :-)  
> 
> I can resubmit the patch if we all agree that /var is better place.
> I just wanted to say that I agree with you...

Well, the problem is that your change would put both the configuration
and state into /var. While the correct thing is to have the
configuration in /etc and the state in /var.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
