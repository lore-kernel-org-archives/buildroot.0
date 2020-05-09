From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 21:50:59 +0200
Subject: [Buildroot] [PATCH v1 4/4] exfatprogs: fix more 64-bit types
 printf compile failure
In-Reply-To: <20200509184246.1b9d9b5a@gmx.net>
References: <20200509162117.8728-1-ps.report@gmx.net>
 <20200509162117.8728-4-ps.report@gmx.net>
 <20200509184246.1b9d9b5a@gmx.net>
Message-ID: <20200509215059.05e5ba56@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 9 May 2020 18:42:46 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Ignore this one, breaks some other toolchains build....update follows ;-)

Also, we probably want a patch to disable -Werror, as this is always
going to cause build problems.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
