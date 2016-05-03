From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 May 2016 09:08:57 +0200
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <1462207070.27026.20.camel@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
 <20160421224301.6a05f711@free-electrons.com>
 <1461965160.27026.9.camel@infradead.org>
 <20160430140314.4ff30ff1@free-electrons.com>
 <1462074238901-b9436b8a-0eb718e2-8f9a915c@mixmax.com>
 <1462207070.27026.20.camel@infradead.org>
Message-ID: <20160503090857.23f362ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 02 May 2016 09:37:50 -0700, Geoff Levand wrote:

> I have the patch below that adds BR2_TOOLCHAIN_HAS_THREADS.  Is
> it enough to pull in the toolchain?

No, adding dependencies at the Config.in level doesn't change anything
in terms of build order.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
