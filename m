From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 23:29:59 +0100
Subject: [Buildroot] [PATCH 1/1] libpjsip: security bump to 2.7.2
In-Reply-To: <20180312084444.31321-1-aduskett@gmail.com> (Adam Duskett's
 message of "Mon, 12 Mar 2018 04:44:44 -0400")
References: <20180312084444.31321-1-aduskett@gmail.com>
Message-ID: <87o9jrip7c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > fixes:
 > - Crash when receiving SDP with invalid fmtp attribute
 > - Crash when parsing SDP with an invalid media format description

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed after adding CVE information, thanks.

-- 
Bye, Peter Korsgaard
