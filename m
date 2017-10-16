From: Lim, Sungyung <slim@draper.com>
Date: Mon, 16 Oct 2017 20:02:26 +0000
Subject: [Buildroot] [buildroot] No hash found for gcc-5.4.0.tar.bz2.
In-Reply-To: <20171016212545.78715dff@windsurf.lan>
References: <e953736f09ba4dd6a73358abf69f44aa@draper.com>
 <20171016212545.78715dff@windsurf.lan>
Message-ID: <52863a95f7d742d4a1a754e66954e9d3@draper.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tom

I downloaded the buildroot from the mathworks git website
[https://github.com/mathworks/buildroot] because of familiarity with mathworks tools such as matlab.

The .config file says

1. buildroot 2017.02 configuration
2. buildroot .config was generated for zynq_zed_defconfig

Thanks - Sungyung



-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: Monday, October 16, 2017 3:26 PM
To: Lim, Sungyung <slim@draper.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [buildroot] No hash found for gcc-5.4.0.tar.bz2.

Hello,

On Mon, 16 Oct 2017 19:07:53 +0000, Lim, Sungyung wrote:

> As a beginner, I'm looking for some advices on the issue : No hash found for gcc-5.4.0.tar.bz2.
>
> Here is a copy of the log from running buildroot make command:
>
> >>> host-gcc-initial 5.4.0 Downloading
> Saving to ~output/build/.gcc-5.4.-.tar.bz2.aYTUOP/output
> ~output/build/.gcc-5.4.0.tar.bz2.aYTUOP/output' saved
> ERROR: No hash found for gcc-5.4.0.tar.bz2
> Make[1]: *** [~output/build/host-gcc-initial-5.4.0/.stamp_downloaded]
> Error 1
> Make: *** [_all] Error 2

Which version of Buildroot are you using? What is your Buildroot .config?

Best regards,

Thomas Petazzoni
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
________________________________
 Notice: This email and any attachments may contain proprietary (Draper non-public) and/or export-controlled information of Draper. If you are not the intended recipient of this email, please immediately notify the sender by replying to this email and immediately destroy all copies of this email.
________________________________
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ATT60177.config
Type: application/octet-stream
Size: 80253 bytes
Desc: ATT60177.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171016/c7910d4e/attachment.obj>
