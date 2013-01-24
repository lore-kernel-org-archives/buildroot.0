From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Jan 2013 07:57:27 -0300
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <5100DE39.70308@mind.be>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <5100DE39.70308@mind.be>
Message-ID: <51011397.6040703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/24/2013 04:09 AM, Arnout Vandecappelle wrote:

>  Gustavo,
> 
>  If you were to submit a v4, could you split this very long line?
> 
>  Regards,
>  Arnout

v4? There's not even a v3 yet! ;-)
There are many fixable lines inside fs/ that are easily wrappable.
For example in ubifs/ubifs.mk, cloop/cloop.mk, initramfs/initramfs.mk
(if we're going for the strict 80 column standard) and others.
But yes, on a new patchset if necessary i could.
Regards.
