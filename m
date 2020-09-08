From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Sep 2020 23:12:58 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/go: security bump to
 version 1.13.15
In-Reply-To: <20200907065658.28428-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 7 Sep 2020 08:56:58 +0200")
References: <20200907065658.28428-1-peter@korsgaard.com>
Message-ID: <87v9go6kh1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2020-16845: Go before 1.13.15 and 14.x before 1.14.7 can have an
 > infinite read loop in ReadUvarint and ReadVarint in encoding/binary via
 > invalid inputs

 > https://github.com/golang/go/issues/40620

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
