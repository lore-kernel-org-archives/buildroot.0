From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 09:31:07 +0200
Subject: [Buildroot] Randomization of kconfig choices?
Message-ID: <20130618093107.6c08e477@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

I'm coming to the news regarding the randomization of kconfig choices?
I know you've put a lot of efforts to try to fix this problem, but if I
remember correctly so far the proposed solutions had some remaining
issues.

I'm jumping back on this topic because yesterday I helped a friend set
up a Buildroot system with X.org for an industrial PC, and we built the
Modular X.org. And I discovered that the issue that our host-python
doesn't have libxml2 support is still there, and it causes a build
failure of Mesa. And since Mesa can only be compiled (currently) when
the Modular X.org is enabled, we never see this problem in the
autobuilders because we default to the Kdrive/TinyX variant.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
