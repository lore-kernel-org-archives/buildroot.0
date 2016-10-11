From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
Date: Tue, 11 Oct 2016 11:44:25 +0000
Subject: [Buildroot] Webtool to analyze package build fail/pass from
	autobuild
Message-ID: <EB86EB452ADE4B44B294F7149B8A277702219383@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

I am part of the ARC GNU team at Synopsys.
More recently in order to analyze progress in buildroot package builds,
I created a web tool that recovers latest build information from
autobuild.buildroot.net and creates an internal database and web-tools
to access it.

This database/webtool is organize such that we can track progress of
which packages are failing or passing at any specific moment, and trace
this failures to a specific build where we can analyze any of the build
related logs.

Moreover, each day/week the tool generates a report sent to all the
team, where it clearly specifies which packages started failing or
passed during the period.

As this tools have been proven to be of great value to us, perhaps you
would feel the same.
The code is shared in:
https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot_stats

Looking forward for your feedback. 

Best regards,
Cupertino

PS: I include some files with images of a report. 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: example_report.png
Type: image/png
Size: 160789 bytes
Desc: example_report.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161011/a1897d32/attachment.png>
