From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 12:03:14 +0200
Subject: [Buildroot] [PATCH] package/rsyslog: install default service
 file
In-Reply-To: <87o8e1mkhf.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 26 Apr 2021 12:02:52 +0200")
References: <20210414210927.1826-1-sam.voss@rockwellcollins.com>
 <87o8e1mkhf.fsf@dell.be.48ers.dk>
Message-ID: <87h7jtmkgt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Sam" == Sam Voss <sam.voss@rockwellcollins.com> writes:
 >> As of v8.2008 rsyslog no longer provides a default service file, and now
 >> suggests using the platform suggested defaults. For Buildroot, install
 >> the Debian service file which has been added in the same version,
 >> however is not included in the official release.

 >> Upstream commit which adds this service file:
 >> https://github.com/rsyslog/rsyslog/commit/cfd07503ba055100a84d75d1a78a5c6cceb9fdab

 >> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

 > Committed, thanks.

(to 2021.02.x I mean).

-- 
Bye, Peter Korsgaard
