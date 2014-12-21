From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:44:32 +0100
Subject: [Buildroot] [buildroot-test 1/2] Taking into account
 BR2_PREFER_STATIC_LIB rename
In-Reply-To: <20141221211358.GB4207@free.fr>
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141221220305.7923490b@free-electrons.com>
 <20141221211358.GB4207@free.fr>
Message-ID: <20141221224432.6e8a2d30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 21 Dec 2014 22:13:58 +0100, Yann E. MORIN wrote:

> If there are some packages that do not like to be build both static and
> shared at the same time, we want to catch those.

I've already pushed my autobuild-run patches, but we can do a followup
patch to implement this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
