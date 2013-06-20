From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 20 Jun 2013 14:37:28 -0500
Subject: [Buildroot] [PATCH v11 09/11] multimedia: reorganize for gst1
In-Reply-To: <20130620095456.1bac20d0@skate>
References: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
 <1371701651-7739-10-git-send-email-spenser@gillilanding.com>
 <20130620095456.1bac20d0@skate>
Message-ID: <CAEBucnD2QtgyQiMAdmRLYYfGDYoDYaNYvzxFDNAmoxqbnzhYaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

>
> I think this organization is good, but I wonder why it's not done when
> the packages are introduced. I.e, the patch adding gstreamer1 should do:
>
> +# GStreamer 1.x & Plugins
> +source "package/multimedia/gstreamer1/Config.in"
>
> Then, the patch adding the base plugins should do:
>
> +source "package/multimedia/gst1-plugins-base/Config.in"
>
> But, ok, I'm nitpicking here :)

I agree that's the better way to do it but it would have meant re
working every single commit. It was far easier just to throw in the
reorganization as a separate patch.

Regards,

Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
