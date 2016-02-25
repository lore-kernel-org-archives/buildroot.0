From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Feb 2016 09:48:22 -0300
Subject: [Buildroot] [PATCH 2/2] gcc: remove 4.5.x
In-Reply-To: <20160225134338.4973dffd@free-electrons.com>
References: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
 <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
 <87io1d3mhr.fsf@dell.be.48ers.dk>
 <20160225104848.2f5d892f@free-electrons.com>
 <87h9gxxgc7.fsf@dell.be.48ers.dk> <56CEDD11.7060603@zacarias.com.ar>
 <20160225134338.4973dffd@free-electrons.com>
Message-ID: <56CEF816.7060002@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/16 09:43, Thomas Petazzoni wrote:

> Blackfin is actually 4.3.
>
> They have an alpha 4.5 compiler, but when we switched to it, many
> things broke and the ADI guys told us to stay on 4.3.
>
> Best regards,
>
> Thomas

Ah yes, i took a random peek at the bfin tarballs i have cached.
Anyway, the more reason to keep 4.5 if 4.3 is still used.
Regards.
