From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Sep 2010 19:19:03 +0200
Subject: [Buildroot] [PATCH] Option to disable mouse cursor in QT
In-Reply-To: <39650.1285687128@iddad.fr>
References: <39650.1285687128@iddad.fr>
Message-ID: <20100928191903.7ef394b1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jean,

On Tue, 28 Sep 2010 17:18:48 +0200
<jean@iddad.fr> wrote:

> My company is developing a touch screen product and we are using QT. Because of the touch
> screen, I don't want to display any mouse pointer/cursor so I patched
> buildroot to disable it at configuration time. As touchscreens become more and more common
> some other people may need this patch as well, so here it is:

Sounds like a good thing to have.

Could you format your patch as an unified diff, and add the proper
description + signed-off-by-line ? This would allow us to keep proper
attribution on the patch. If you're not interested by being directly
attributed the work of this patch, I can also merge it manually.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
