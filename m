From: Ben Dooks <ben@fluff.org>
Date: Tue, 26 Jun 2007 14:33:27 +0100
Subject: [Buildroot] ARM EABI builds
Message-ID: <20070626133327.GA5989@trinity.fluff.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone had success with building an EABI buildroot? I have tried
building ARM (arm920t,gcc 4.1.2) and the image produced hangs (it
seems vfprintf does not work)

I have succesfully built images with gcc 4.1.2 and a patch to make it
build gcc with OABI.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
