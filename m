From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:43:01 +0200
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <cover.1459798147.git.geoff@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
Message-ID: <20160421224301.6a05f711@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 04 Apr 2016 19:31:49 +0000, Geoff Levand wrote:

> Geoff Levand (3):
>       go-bootstrap: new host package
>       go: new host package
>       flannel: new package

Now that those patches have been merged, we're starting to see some
build issues:

 - With host-go:
   http://autobuild.buildroot.org/?reason=host-go-1.5.3

 - With flannel:
   http://autobuild.buildroot.org/?reason=flannel-v0.5.5

Could you have a look at those build problems?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
