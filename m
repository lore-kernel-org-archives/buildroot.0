From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 09:30:36 -0500
Subject: [Buildroot] [PATCH] Makefile: fix ignored trace at
 target-finalize
In-Reply-To: <20161123092436.270ba426@free-electrons.com>
References: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
 <20161123092436.270ba426@free-electrons.com>
Message-ID: <20161123143035.zg7bn57qdfnxus53@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Nov 23, 2016 at 09:24:36AM +0100, Thomas Petazzoni wrote:
> Ah, what is the problem with that? Just the fact that there is this
> "Error 1 (ignored)" message?
> 

Yes, just a nitpick.

There is absolutly no error: simply the trace. Error when things are `ok'. 

Also to be more consistent with what is applied at the next line:
stderr + || true.
