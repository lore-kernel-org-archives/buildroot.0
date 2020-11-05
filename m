From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Nov 2020 09:46:38 +0100
Subject: [Buildroot] [PATCH 09/10] support/scripts/{pkg-stats, cve.py,
 cve-checker}: support CPE ID based matching
In-Reply-To: <CANQCQpbd3KhH9MLAFMXMzw6u=2wKX0o+jH2-VuoQDjiOnNt+aw@mail.gmail.com>
 (Matthew Weber's message of "Wed, 4 Nov 2020 12:33:36 -0600")
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
 <CANQCQpbd3KhH9MLAFMXMzw6u=2wKX0o+jH2-VuoQDjiOnNt+aw@mail.gmail.com>
Message-ID: <87eel8198x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Thomas / Greg,
 >> diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
 >> index 421202d049..e1dfab3805 100755
 >> --- a/support/scripts/cve-checker
 >> +++ b/support/scripts/cve-checker

 > I noticed this tool isn't described in the manual with at least an
 > example invocation noting why the nvd folder is being cached and the
 > piping of show-info output, etc.

Yes, I noticed that as well while updating CHANGES for 2020.11-rc1. It
also reads stdin before handling the command line arguments, so you
cannot just run ./support/scripts/cve-checker --help to get usage info
:/

-- 
Bye, Peter Korsgaard
