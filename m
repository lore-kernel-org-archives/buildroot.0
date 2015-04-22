From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 09:39:30 +0200
Subject: [Buildroot] [PATCH v2] heimdal: explicitly set -lpthread
In-Reply-To: <55372443.909@gmail.com>
References: <1429581853-24749-1-git-send-email-bluemrp9@gmail.com>
 <20150421093509.0cdd1240@free-electrons.com>
 <55372443.909@gmail.com>
Message-ID: <20150422093930.4bacca8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Tue, 21 Apr 2015 21:32:03 -0700, Ryan Coe wrote:

> I still get a build failure relating to a missing -lpthread with this 
> method.

If the failure you're getting is the one you reported in the other
e-mail, I already replied that it's because you didn't apply my patch.
Can you retry with my patch applied, and if it fails, post somewhere
the build output of the host-heimdal package?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
