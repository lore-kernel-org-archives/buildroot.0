From: Petr Kulhavy <brain@jikos.cz>
Date: Fri, 26 Jan 2018 14:26:29 +0100
Subject: [Buildroot] Dropbear remote login fails
Message-ID: <0f79957c-e9fd-0b25-e19b-a93149eaffe0@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

recently I upgraded my system to the latest version of buildroot. After 
that I noticed that I cannot any longer ssh on my device because the 
default shell /bin/sh for the root is not in /etc/shells.

Shouldn't it be added there? Or have I misconfigured something?

Thanks
Petr
