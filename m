From: Scott Dudley <scott@telesoft.com>
Date: Fri, 02 Sep 2011 08:30:08 -0700
Subject: [Buildroot] buildroot-2011.08, crosstool-ng-1.12.1, and Samba
In-Reply-To: <20110902090739.373ab82f@skate>
References: <4E600F20.7010606@telesoft.com> <20110902090739.373ab82f@skate>
Message-ID: <4E60F680.4040401@telesoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/02/2011 12:07 AM, Thomas Petazzoni wrote:
>
> Hello Scott,
>
> Thanks for your report!
>
> [...]
>
> And Buildroot does not copy those files to the target automatically.
> Maybe we need to extend the toolchain mechanism a bit to provide an
> option to copy those files. Copying them all unconditionally is
> unfortunately not really an option: the complete gconv directory
> contains ~9 MB of libraries.
>
> Which toolchain are you using ?
  crosstool-ng v1.12.1
> Regards,
>
> Thomas

-- 
Scott Dudley
Senior Developer

Telesoft Corp. | 1661 E. Camelback Rd., Suite 300 | Phoenix, AZ, 85016

*o:* (602) 308-1115**| *f:* (602) 308-1300 | *w:* www.telesoft.com 
<http://www.telesoft.com>

*TEM Edge Blog <http://www.telesoft.com/blog> *|*Twitter 
<http://www.twitter.com/_Telesoft> *|*Facebook

<http://www.facebook.com/pages/Telesoft-Corp/76397971661>Join us at 
Telesoft Connections 2011. Learn more now! 
<http://www.telesoftconference.com>*

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110902/4258d04c/attachment.html>
