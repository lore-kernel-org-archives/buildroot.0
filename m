From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 15:45:08 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/eudev: fix build with musl +
 libselinux
In-Reply-To: <55BB769E.1040808@openwide.fr>
References: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
 <1438272098-28557-2-git-send-email-romain.naour@openwide.fr>
 <20150730225905.5572cb98@free-electrons.com>
 <55BB769E.1040808@openwide.fr>
Message-ID: <20150731154508.2ef5cc54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 31 Jul 2015 15:22:38 +0200, Romain Naour wrote:

> That's because I enclosed the "else" content containing the full log_debug()
> inside HAVE_MALLINFO...

Yes, but that's what I'm criticizing :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
