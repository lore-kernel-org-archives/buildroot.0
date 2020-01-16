From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Thu, 16 Jan 2020 10:01:09 +0000
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <20200116103120.7b41295a@windsurf>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
Message-ID: <e7e0088e1b76adf1492f06e81b386a0018b9336b.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> However, one question that is raised by Yann's patch is whether we
> want
> to forbid using branches when TRANSIENT_DOWNLOAD is NO.
> 

Just to be sure I understand, when you say "when TRANSIENT_DOWNLOAD is
NO.", it'd be the same as if TRANSIENT_DOWNLOAD download is not defined
at all, right?
If it's the case, then that seems to me like a good idea, because it
renders explicit the risk taken by the user when using a branch (which
can be done unknowingly ATM).

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
