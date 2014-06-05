From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Jun 2014 15:18:41 -0300
Subject: [Buildroot] [PATCH] radvd: bump to version 1.12
In-Reply-To: <1401968249-32408-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401968249-32408-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5390B481.7070008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/2014 08:37 AM, Gustavo Zacarias wrote:

> -RADVD_VERSION = 1.10.0
> +RADVD_VERSION = 1.12

Sigh, seems upstream skipped the 1.11 release, shipped as 1.12, then
noticed the skipping and renamed to 1.11 (or so, i haven't compared).
The announcement:
http://lists.litech.org/pipermail/radvd-devel-l/2014-June/000775.html
Website now says 1.11 is latest and 1.12 is no longer available.
So disregard and better wait until their mind is made up.
Thanks to Waldemar for bringing this up on irc.
Regards.
