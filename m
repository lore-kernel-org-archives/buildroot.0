From: Tom Deblauwe <tom.deblauwe@ebo-enterprises.com>
Date: Thu, 22 May 2014 14:01:29 +0200
Subject: [Buildroot] psplash and systemd
In-Reply-To: <20140521192928.GA3672@ned>
References: <537C657F.4090106@ebo-enterprises.com> <20140521192928.GA3672@ned>
Message-ID: <537DE719.9010205@ebo-enterprises.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-05-14 21:29, Eric Le Bihan wrote:
> Please find attached a patch that installs two new services for using psplash
> with systemd. These are inspired by the ones from Plymouth
> (http://cgit.freedesktop.org/plymouth/tree/systemd-units/):

Hello Eric,

Thanks for this patch it helps me indeed and works. However I am looking
into starting it even earlier in the boot process so I'll let something
know if I find it.

Thanks,
Best regards,
Tom,
Email Confidentiality: e-BO Enterprises<http://www.ebo-enterprises.com/> Company Registration Number BE 0470174242. This email message and any attachments are for the sole use of the intended recipient(s) and may contain information that is proprietary to e-BO Enterprises<http://www.ebo-enterprises.com/>. If you have received this message in error, please notify the sender by reply, and delete all copies of this message and any attachments. If you are the intended recipient you may use the information contained in this message and any files attached to this message only as authorized by e-BO Enterprises<http://www.ebo-enterprises.com/>. Any unauthorized use, dissemination or disclosure of this message or its attachments is strictly prohibited. The contents of this e-mail are not to be considered binding upon e-BO Enterprises<http://www.ebo-enterprises.com/>.
