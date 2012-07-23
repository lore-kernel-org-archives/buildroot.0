From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jul 2012 22:51:23 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.3.15
In-Reply-To: <1343064116-7123-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343064116-7123-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120723225123.479e4d92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jul 2012 14:21:56 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Fix for CVE-2012-2688 (potential overflow in _php_stream_scandir),
> CVE-2012-3365 (SQLite open_basedir bypass) and other misc bugfixes.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
