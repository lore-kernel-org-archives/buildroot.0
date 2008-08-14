From: Mikael Sundberg <micke@oddjob.se>
Date: Thu, 14 Aug 2008 16:59:24 +0200
Subject: [Buildroot] Autodetect architechture
Message-ID: <48A4484C.9020000@oddjob.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone, I?m new on this list and have a problem.

When I try to build with "fontconfig" enabled I get a configuration 
error saying:
 - "Cannot autodetect architecture while crosscompiling", bails out and 
tells me to use the "--with-arch" option.
In "package/fontconfig/fontconfig.mk" there a 
"--with-arch=$(GNU_TARGET_NAME)" in the FONTCONFIG_CONF_OPT but it 
doesn?t seem to be added when the configure script runs.

Any ideas? Need more info?

I have been able to build buildroot in the past without this problem but 
then I got a HDD-crash and the working environment was lost.

regards,
Mikael Sundberg
