From: Davis Mcpherson <davis.mcpherson@gmail.com>
Date: Wed, 2 Feb 2011 08:44:33 -0500
Subject: [Buildroot] What Target Architecture Variant to select for MPC8548
Message-ID: <5090347B-83AB-4395-8DCB-9BD1BE1366A7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm building the latest stable version of buildroot for a MPC8548 processor,  and would like to select the most appropriate setting for the "Target Architecture Variant" configuration option.  I'm using 'make menuconfig' to configure the build, and the options presented for this do not include a specific one for the 8548,  there is an 8540 and there is an e500mc (the 8548 has the e500 core)...

I'm trying my first build with this configuration option set to 'generic'...

Is one the more specific options better for this processor?

thanks,

davis mcpherson
