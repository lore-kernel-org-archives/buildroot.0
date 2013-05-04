From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 04 May 2013 14:58:01 -0300
Subject: [Buildroot] [PATCH] automake version update 1.12.4
In-Reply-To: <1352464469-22784-1-git-send-email-alexander@mezon.ru>
References: <1352464469-22784-1-git-send-email-alexander@mezon.ru>
Message-ID: <51854C29.2050902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/2012 09:34 AM, Alexander Khryukin wrote:

> -AUTOMAKE_VERSION = 1.11.6
> +AUTOMAKE_VERSION = 1.12.4

I must say nack to using the automake 1.12.x series for now.
There are a few packages that fail with the 1.12.x series which i
considered when bumping/testing automake to the 1.11.x series because of
deprecated/removed features.
These packages need to be fixed before (example: neardal), otherwise the
bump would just introduce build errors.
Regards.
