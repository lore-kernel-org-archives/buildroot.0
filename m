From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:38:46 +0200
Subject: [Buildroot] [PATCH next 09/11] gst1-plugins-ugly: bump version
 to 1.12.0
In-Reply-To: <20170509172119.33642-9-Vincent.Riera@imgtec.com>
References: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
 <20170509172119.33642-9-Vincent.Riera@imgtec.com>
Message-ID: <20170511233846.7bace87c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 May 2017 18:21:17 +0100, Vicente Olivert Riera wrote:

> -config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
> -	bool "mad (*.mp3 audio)"

You're removing an option, so a change to Config.in.legacy is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
