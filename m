From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:17:48 +0200
Subject: [Buildroot] [PATCH v2] nginx-upload-module: new package
In-Reply-To: <1468552217-17318-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1468552217-17318-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160716151748.1b901462@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 22:10:17 -0500, Matt Weber wrote:
> From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
> 
> A module for nginx web server for handling file uploads using
> multipart/form-data encoding (RFC 1867).
> 
> Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

This seems to break the build in certain conditions:

  http://autobuild.buildroot.net/results/64b/64b1bde02346ca67b670f0b095bd3acad707e8cd/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
