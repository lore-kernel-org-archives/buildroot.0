From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:32:07 +0100
Subject: [Buildroot] [PATCH 1/2] webkitgtk: Add missing libtasn1
 dependency
In-Reply-To: <20180125204203.14165-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 25 Jan 2018 22:42:02 +0200")
References: <20180125204203.14165-1-aperez@igalia.com>
Message-ID: <87efm68b08.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Nowadays libtasn1 is always required and if not present the CMake
 > configuration step would fail.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2017.02.x and 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
