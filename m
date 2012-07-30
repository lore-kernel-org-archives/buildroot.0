From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:23:05 +0200
Subject: [Buildroot] [PATCH] less: build after busybox
In-Reply-To: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343330317-24730-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120730192305.58e21f66@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jul 2012 16:18:37 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Build less after busybox if it's enabled, since we prefer the full-blown
> version over the light one if it's enabled (and busybox would overwrite
> the link when built afterwards).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
