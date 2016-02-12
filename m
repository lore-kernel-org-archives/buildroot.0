From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 10:48:22 +0100
Subject: [Buildroot] [PATCH] Don't install in mysql directory
In-Reply-To: <56BDA833.4080506@proximus.be>
References: <1450051027-23633-1-git-send-email-arnout@mind.be>
 <20151229212831.07ec737f@free-electrons.com>
 <56BDA833.4080506@proximus.be>
Message-ID: <20160212104822.776f573f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 10:38:59 +0100, Johan Sagaert wrote:

> I noticed that the ld.so.conf is not working so i just created a 
> symbolic link in /usr/lib pointing to libmysqlclient.so.16

Can you be more specific about the problem you encountered?

Normally, thanks to Arnout's patch, libmysqlclient.so should be
installed in /usr/lib directly, which removes the need for ld.so.conf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
