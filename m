From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:28:10 +0200
Subject: [Buildroot] [PATCH 0/5] gstreamer1: Plugin work
In-Reply-To: <20190509224624.80437-1-aduskett@gmail.com>
References: <20190509224624.80437-1-aduskett@gmail.com>
Message-ID: <20190526212810.7ea8d8a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Thu,  9 May 2019 18:46:18 -0400
aduskett at gmail.com wrote:

> Adam Duskett (5):
>   package/gstreamer1/gst1-plugins-good: Add twolame plugin
>   package/gstreamer1/gst1-plugins-good: Add jack plugin
>   package/gstreamer1/gst1-plugins-bad: add proxy plugin
>   package/gstreamer1/gst1-plugins-bad: add audiolatency plugin
>   package/gstreamer1/gst1-plugins-bad: Add bluez plugin

I've applied to next, with some changes. First, the commit titles are
not consistent in terms of lower-case vs. upper-case. You use "add" or
"Add". I personally prefer lower-case.

Secondly, the patches are not adding plugins, but adding options, so
"add twolame plugin option" is more correct.

I did some other changes to one patch, I'll reply to that one
specifically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
