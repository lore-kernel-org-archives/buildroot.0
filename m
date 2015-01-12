From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 23:05:38 +0100
Subject: [Buildroot] [PATCHv4 4/4] start-stop-daemon: new package
In-Reply-To: <1417107630-14909-5-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150112230538.763bdaf8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Nov 2014 14:00:30 -0300, Gustavo Zacarias wrote:

> +START_STOP_DAEMON_LICENSE = Public Domain
> +START_STOP_DAEMON_LICENSE_FILES = utils/start-stop-daemon.c

While start-stop-daemon.c itself is under the Public Domain, it is
linked against the compat library in lib/compat, which is under GPLv2+.
So I've changed the license to GPLv2+ and the license file to COPYING,
and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
