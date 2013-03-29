From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Fri, 29 Mar 2013 16:56:51 +0100
Subject: [Buildroot] elftosb package
Message-ID: <15AE5A936F5E3A42A9144E66875A0A89308AC8@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,
 
For the imx28 I need the elftosb tool to generate the u-boot.sb file. At
the moment I use the version from an earlier installed ltib
configuration, but I would like to install this as be part of the
buildroot toolchain. This seems to be possile, since there is an elftosb
package directory. However: it is not added to the package configuration
to select it and it lacks a Config.in file. Can anyone tell me how I can
add this package?

Thanks,

Ruud
