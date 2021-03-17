From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:02:17 +0100
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix checksum of
 license
In-Reply-To: <86d5deb9-b0d8-b655-21b6-0f1f3a3f1f96@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Sun, 7 Mar 2021 20:45:33 +0100")
References: <86d5deb9-b0d8-b655-21b6-0f1f3a3f1f96@grenoble.cnrs.fr>
Message-ID: <87y2elwqme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Edgar" == Edgar Bonet <bonet@grenoble.cnrs.fr> writes:

 > Commit ca1604388a86d73c548c6e65eadd13f424685838 updated the checksum of
 > the tarball, but failed to update the one of main.c, which serves as a
 > license file.

 > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Committed to 2021.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
