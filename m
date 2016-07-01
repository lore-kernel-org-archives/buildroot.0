From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:47:45 +0200
Subject: [Buildroot] [PATCH] package/quagga: Add systemd.service file
In-Reply-To: <1a81eea6-95a9-7bc1-aee2-8780caecba8a@gmail.com>
References: <1466874128-22828-1-git-send-email-nroach44@gmail.com>
 <91c2c2b3-7715-2ab6-31ab-144aa346c54b@mind.be>
 <76555fc3-8603-91d7-ad8f-ecdef822df16@gmail.com>
 <49651e9d-0a96-c7de-fb8b-1ec4e21324f8@mind.be>
 <1a81eea6-95a9-7bc1-aee2-8780caecba8a@gmail.com>
Message-ID: <20160701234745.1b6eb306@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 20:02:47 +0800, Nathaniel Roach wrote:

> >   Maybe there should be a ConditionFileIsExecutable in the [Unit] section?  
> That was a good condition that I didn't think of. In that case the unit 
> will fail and restart until it hits the start limit. I've since added in 
> the Condition stanza and everything works as intended.

Could you send an updated version that takes into account Arnout's
comments and especially the addition of this condition?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
