From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:17:21 +0100
Subject: [Buildroot] [PATCH] lttng-tools: bump version to 2.9.3
In-Reply-To: <20170111142423.48621-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Wed, 11 Jan 2017 14:24:23 +0000")
References: <20170111142423.48621-1-Vincent.Riera@imgtec.com>
Message-ID: <87eg07at1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > 0001-Fix-Add-missing-pthread.h-include.patch already included in this
 > release:

 >   https://github.com/lttng/lttng-tools/commit/5f702b607116a8303cb09fb091d8b9740c06baca

 > --with-xml-prefix configure option doesn't exist, so drop it:

 >   configure:22815: WARNING: unrecognized options: [snip], --with-xml-prefix

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
