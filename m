From: Patrick <kpa_info@yahoo.fr>
Date: Fri, 25 Jan 2013 09:41:27 +0100
Subject: [Buildroot]  menuconfig error with python packages
Message-ID: <51024537.2010204@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I have detected what it seems a strange behaviour with python in the 
menuconfig. When activating python3 (BR2_PACKAGE_PYTHON3) the submenu 
"external python modules" is not visible.
When activating dstat (BR2_PACKAGE_DSTAT) from "Debugging, profiling and 
benchmarking" the "external python modules" submenu become visible.

Is this really the expected behaviour ? I don't think so

Patrick
