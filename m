From: suffecool at comcast.net <suffecool@comcast.net>
Date: Fri, 05 Dec 2008 15:57:19 +0000
Subject: [Buildroot] disabling loadable module support
Message-ID: <120520081557.4462.49394F5F000C7AFD0000116E22134843730401010C0A00009A9C@comcast.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Today I tried to see the impact on kernel size by turning OFF loadable module support.  I typed:

% make linux26-menuconfig

and unchecked the "Enable loadable module support" menu option.

When I tried to recompile, I get the somewhat humorous error message:

The present kernel configuration has modules disabled.
Type 'make config' and enable loadable module support.
Then build a kernel with module support enabled.

Has anyone been able to build such a kernel using buildroot?  Thanks.

--Kev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081205/48fb6d3d/attachment.htm 
