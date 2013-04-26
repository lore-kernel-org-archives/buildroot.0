From: Lars Dunemark <ladu@hms.se>
Date: Fri, 26 Apr 2013 08:48:37 +0000
Subject: [Buildroot] Adding local file system overlay
In-Reply-To: <1768202256.1976834.1366961616672.JavaMail.root@openwide.fr>
References: <6119D107D82B0940B389FAED3F2DDE6616222D57@Ansuz.hms.se>
 <1768202256.1976834.1366961616672.JavaMail.root@openwide.fr>
Message-ID: <6119D107D82B0940B389FAED3F2DDE6616222E08@Ansuz.hms.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> doesn't buildroot already do that ?
> 
> system configuration => overlay directory
> 
> or is your patch doing something different
Currect Buildroot has this functionality but this requires me to update the configuration for my build target.

My suggestion is to allow this without configuration changes, making it possible to alternate a build on your local machine without risking getting it in the default configuration for that target when doing make savedefconfig.


Best regards
Lars Dunemark
