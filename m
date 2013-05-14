From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 21:45:45 +0200
Subject: [Buildroot] [PATCHv2 1/1] external-toolchain: add Sourcery
 CodeBench ARM 201305 Signed-off-by: Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <1368560249-6484-1-git-send-email-olivier.schonken@gmail.com>
References: <1368560249-6484-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130514214545.7a52b035@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

Please leave an empty new line between the commit title and your
Signed-off-by line, otherwise your Signed-off-by line becomes part of
the commit title.

Please fix 201305 -> 2013.05 in the commit title.

Also, for every brand/architecture we only keep 3 toolchains around. So
when you add a new Sourcery ARM toolchain, you should also get rid of
the oldest one that is supported in Buildroot, so that in the end, we
have no more than 3 toolchains supported.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
