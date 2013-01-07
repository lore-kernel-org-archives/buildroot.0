From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 13:36:53 +0100
Subject: [Buildroot] [PATCH 2/2] barebox: needs host-lzop
In-Reply-To: <1355396382-14652-2-git-send-email-fabio.porcedda@gmail.com>
References: <1355396382-14652-1-git-send-email-fabio.porcedda@gmail.com>
 <1355396382-14652-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20130107133653.6e132264@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 13 Dec 2012 11:59:42 +0100, Fabio Porcedda wrote:
> Add host-lzop dependency.
> Use $(TARGET_MAKE_ENV) when calling $(MAKE)
> to able to use binaries built for host.

Does Barebox always need lzop? If not, under what conditions does it
need lzop?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
