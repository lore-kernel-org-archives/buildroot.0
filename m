From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 09:50:03 +0200
Subject: [Buildroot] Unable to boot via initrd
In-Reply-To: <1378248110591-50638.post@n4.nabble.com>
References: <1378148801760-50517.post@n4.nabble.com> <52260A30.309@mind.be>
 <1378248110591-50638.post@n4.nabble.com>
Message-ID: <20130904095003.05160a45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthieu,

On Tue, 3 Sep 2013 15:41:50 -0700 (PDT), Matthieu wrote:

> I have checked also if the /root directory contains an init file. I
> do not find the init file.

I know it might have been confusing, but Arnout said the "root
directory", not the "/root directory". The root directory is the root
of the filesystem, i.e what becomes "/" on the target system, or what
is output/target/ in the Buildroot output directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
