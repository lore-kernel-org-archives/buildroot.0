From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Oct 2014 20:01:28 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.0
In-Reply-To: <1412214757-3948-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 1 Oct 2014 20:52:37 -0500")
References: <1412214757-3948-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87h9zmmjuv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > * Adds powerpc architecture support
 > * Changes to the new github upstream site
 > * Updates the license filename

 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > ---

 >  PROTOBUF_LICENSE = BSD-3c
 > -PROTOBUF_LICENSE_FILES = COPYING.txt
 > +PROTOBUF_LICENSE_FILES = LICENSE

Huh?

make protobuf-legal-info
cat: /home/peko/source/buildroot/output/build/protobuf-2.6.0/LICENSE: No such file or directory

I see there's still a COPYING.txt

-- 
Bye, Peter Korsgaard
