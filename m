From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Jul 2014 18:46:11 -0300
Subject: [Buildroot] [PATCH] Fixing ntpd time syncing problem
In-Reply-To: <1402405120-3695-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1402405120-3695-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <53BC66A3.5070900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/2014 09:58 AM, Angelo Compagnucci wrote:

> Add ntp.conf file to make ntpd syncing.
> Starting ntpd daemon with -g to sync time also with big offsets.
> Removes the use of deprecated ntpdate command for initial time sync.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

The "restrict -6" configuration directives give non-critical errors when
building with a non-IPv6 toolchain, it's not nice but it works anyway, so:

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
