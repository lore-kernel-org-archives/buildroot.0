From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 07 Oct 2013 18:02:59 -0300
Subject: [Buildroot] [PATCH] Revert "berkeleydb: bump to version 6.0.20"
In-Reply-To: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
References: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
Message-ID: <52532183.6060206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2013 04:36 PM, J?r?me Pouiller wrote:

> BerkeleyDB has changed its license since version 6. New license (AGPL) may
> be incompatible with some packages. So we prefer to stick to version 5
> 
> This reverts commit 4c478de2e76ffc1d0a6dc413475307fd44a0a595.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
