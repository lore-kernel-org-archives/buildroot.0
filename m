From: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Wed, 7 Feb 2018 07:47:37 +0000 (UTC)
Subject: [Buildroot] [PATCH v2] open-lldp: add patch to remove pid_t
 error
In-Reply-To: <20180206164910.37620947@windsurf>
References: <20180122120903.22839-1-laurent_pubs@yahoo.com>
 <20180206164910.37620947@windsurf>
Message-ID: <2110951609.3446284.1517989657961@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
I submitted this patch (and several other patches) to upstream last week.http://lists.open-lldp.org/pipermail/lldp-devel/2018-January/thread.html

Unfortunately I had no answer. I don't know whether the project is actively maintain or not.
Best Regards,Laurent

      From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 To: Laurent Charpentier <laurent_pubs@yahoo.com> 
Cc: buildroot at buildroot.org
 Sent: Tuesday, February 6, 2018 4:49 PM
 Subject: Re: [Buildroot] [PATCH v2] open-lldp: add patch to remove pid_t error
   
Hello,

On Mon, 22 Jan 2018 13:09:03 +0100, Laurent Charpentier wrote:
> Added #include <sys/types.h> to fix unknown type 'pid_t' errors.
> 
> This is to fix autobuild failures:
> http://autobuild.buildroot.net/results/f7e94ae1c2aa6b3f6567d1f567a66329974834e9
> http://autobuild.buildroot.net/results/8a43938d9c0391a846757a54cf5f956b64470865
> 
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> ---
>? .../open-lldp/0004-fixed-unknown-type-pid_t.patch? | 41 ++++++++++++++++++++++
>? 1 file changed, 41 insertions(+)
>? create mode 100644 package/open-lldp/0004-fixed-unknown-type-pid_t.patch

Applied to master, thanks. Could you submit this patch upstream if not
already done?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com


   
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180207/c00cd9ed/attachment-0001.html>
