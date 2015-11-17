From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 22:29:13 +0100
Subject: [Buildroot] [PATCH v2] readline: install configuration file
 from package recipe
In-Reply-To: <1447780845-22019-1-git-send-email-jezz@sysmic.org>
References: <1447780845-22019-1-git-send-email-jezz@sysmic.org>
Message-ID: <20151117222913.4c5a4676@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 17 Nov 2015 18:20:45 +0100, J?r?me Pouiller wrote:
> /etc/inputrc is configuration file for readline. However, until now, it
> was provided by skeleton. This patch install /etc/inputrc from readline
> recipe.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
> v2:
>   Send patch using -M

Applied to next, thanks!

Thanks for this /etc/inputrc and /etc/issue fixes. It's definitely good
to strip down a bit the skeleton.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
