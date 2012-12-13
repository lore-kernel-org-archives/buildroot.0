From: Richard Braun <rbraun@sceen.net>
Date: Thu, 13 Dec 2012 23:04:34 +0100
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <50CA4A8F.1050002@mind.be>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk> <50CA4A8F.1050002@mind.be>
Message-ID: <20121213220434.GA819@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 13, 2012 at 10:37:19PM +0100, Arnout Vandecappelle wrote:
> - if you use anything else than static device management, the devtmps
> will not be mounted automatically by the kernel; the cpio filesystem
> adds a /init script that mounts it for you.

The kernel has provided the ability to automatically mount devtmpfs for
quite some time now. He just needs to make sure the option is selected
in the kernel configuration.

-- 
Richard Braun
