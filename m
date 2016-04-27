From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:14:51 +0200
Subject: [Buildroot] [PATCH v3] i7z: new package
In-Reply-To: <1461762764-8559-1-git-send-email-vincent.stehle@intel.com>
References: <5qd6vcx7kl.ln2@ID-313208.user.individual.net>
 <1461762764-8559-1-git-send-email-vincent.stehle@intel.com>
Message-ID: <20160427221451.0d2fa3ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 15:12:44 +0200, Vincent Stehl? wrote:
> "A better i7 (and now i3, i5) reporting tool for Linux."
> 
> i7z can print out the C-states and temperature for i3, i5 and i7 based Core
> processors from Intel (including Nehalems, Sandy Bridge and Ivy Bridge).
> 
> https://github.com/ajaiantilal/i7z
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

Applied to master, thanks.

However, I don't know if you had a look at the source code itself. But
it is really truly horrible. I think I had never seen a function taking
34 arguments, so much code WRITTEN ALMOST ENTIRELY IN CAPS and
generally such an atrocity. And I'm used to looking at vendor code in
Linux BSPs, so I'm somewhat used to all sort of atrocities.

  https://github.com/ajaiantilal/i7z/blob/master/i7z_Dual_Socket.c

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
