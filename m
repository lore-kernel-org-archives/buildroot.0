From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Nov 2013 22:36:32 +0100
Subject: [Buildroot] Autobuilder site back online
Message-ID: <20131116223632.462c6e60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As many of you have noticed, the autobuild.buildroot.org web site has
been down for a number of days. It was hosted on a Virtual Private
Server that I have been using since 10+ years, but it was getting short
on disk space, was not very powerful, and more importantly, I did not
have access to the host machine, which means that whenever something
bad/wrong was happening, there was nothing I could do, except rely on
people who didn't always had enough time to take care of the issue in a
timely fashion.

Therefore, I have migrated the service to a dedicated server that I
own. I have direct access to the support team, I can reboot the server,
access the logs. And this server has more disk space (1 TB) and is much
more powerful than the previous one.

This new service is temporarily available at:

	http://autobuild.humanoidz.org

The build results from the Free Electrons build server have already
started to flow into this new infrastructure.

There are a few things that remain to be done:

 * Changing the autobuild.buildroot.org to point to this new server.
   I've already asked Peter to do so.

 * Changing the configuration of the build servers maintained by Peter
   so that they send their results to the new infrastructure. I've also
   asked Peter to do so.

 * Re-add the daily e-mails to the new infrastructure. However, since I
   couldn't access the old server to turn them off, the old server will
   start sending them (empty probably when it goes up). So as soon as
   I'll have access to the old server to turn it off, I will migrate
   the daily e-mails to the new infrastructure.

 * Import the history of build results. This also requires me to have
   access to the old server and transfer all the results to the new
   server. It might take a bit of time.

Sorry again for the noise. At least, the build results are back up,
which is the most important during this -rc cycle.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
