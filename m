From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 20:58:03 +0200
Subject: [Buildroot] [PATCH v4 00/22] Automatically produce legal
 compliance info
In-Reply-To: <20120717193610.638fabb2@skate>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <20120717193610.638fabb2@skate>
Message-ID: <20120717205803.1dca9f8c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 19:36:10 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Following the comments of several Buildroot contributors, I have merged
> the 22 patches of your series. Thanks a lot for your perseverance in
> getting this merged!

I have also added the execution of 'make legal-info' to my autobuilder.
So all builds coming from the Free Electrons build server visible at
http://autobuild.buildroot.org will have the CSV file of the licenses.
It is not directly visible in the webpage, but if you go in the "dir"
link, and then look at the licenses-manifest.csv file, it corresponds
to the output/legal-info/manifest.csv file.

Example:
http://autobuild.buildroot.org/results/a07c8611de688b6dccbfae00ff153ad89f3e7f77/licenses-manifest.csv

This way, the legal-info machinery will be exercised on many packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
