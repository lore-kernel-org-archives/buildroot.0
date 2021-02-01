From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 11:08:57 +0100
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: drop
 unrecognized options
In-Reply-To: <20210131133200.3976386-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 31 Jan 2021 14:31:59 +0100")
References: <20210131133200.3976386-1-fontaine.fabrice@gmail.com>
 <20210131133200.3976386-2-fontaine.fabrice@gmail.com>
Message-ID: <87v9bcnlqe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > BUILD_ALONG_WITH_CMRTLIB has been dropped since version 18.2.0 and
 > https://github.com/intel/media-driver/commit/c3e13c175d12790ab70c4de3521e47f62be780de

 > RUN_TEST_SUITE is also unrecognized (only MEDIA_RUN_TEST_SUITE is
 > recognized)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
