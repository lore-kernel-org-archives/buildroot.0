From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:38:13 +0200
Subject: [Buildroot] [PATCH next 05/11] gst1-plugins-bad: bump version
 to 1.12.0
In-Reply-To: <20170509172119.33642-5-Vincent.Riera@imgtec.com>
References: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
 <20170509172119.33642-5-Vincent.Riera@imgtec.com>
Message-ID: <20170511233813.4ffb0130@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 May 2017 18:21:13 +0100, Vicente Olivert Riera wrote:

>  package/gstreamer1/gst1-plugins-bad/Config.in      | 46 +----------

You're removing lots of Config.in options here, but you forgot to add
the appropriate logic to Config.in.legacy. Could you fix that up?

Also, could you comment on how much build testing and runtime testing
this series has received ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
