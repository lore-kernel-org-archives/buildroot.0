From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:52:12 +0100
Subject: [Buildroot] [PATCH] package/python3: disable decimal module
In-Reply-To: <1420300755-24170-1-git-send-email-s.martin49@gmail.com>
References: <1420300755-24170-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150103215212.35768eac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat,  3 Jan 2015 16:59:15 +0100, Samuel Martin wrote:
> Python3 decimal module needs libmpdecimal >=2.4.1.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/c9b/c9b6dd19f16a56a16ef441d5b303badab9720bd7/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Thanks, but bumping the mpdecimal package seems like a better solution
in such cases. I've used an alternate upstream location for now, since
indeed the official site is down.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
