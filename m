From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 18:11:22 +0200
Subject: [Buildroot] [PATCH 2/3] inadyn: do not install default conf file
In-Reply-To: <20161013034247.21603-2-bluemrp9@gmail.com>
References: <20161013034247.21603-1-bluemrp9@gmail.com>
 <20161013034247.21603-2-bluemrp9@gmail.com>
Message-ID: <20161016181122.01729058@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Oct 2016 20:42:46 -0700, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

The commit message is empty, and therefore we don't understand why you
are removing this default configuration file. Having a default
configuration file seems very useful: it clearly shows to the user what
needs to be tweaked to configure inadyn.

What is your motivation for removing this? Is it because the 2.0
version has a different configuration file format? Something else?

Please write a more verbose commit log, in any case.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
