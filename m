From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:55:31 +0100
Subject: [Buildroot] [PATCH] package/atftp: add security fix for
 CVE-2020-6097
In-Reply-To: <20210205090101.17220-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 5 Feb 2021 10:01:01 +0100")
References: <20210205090101.17220-1-peter@korsgaard.com>
Message-ID: <87h7mjn464.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixed the following security issue:
 > - CVE-2020-6097: An exploitable denial of service vulnerability exists in
 >   the atftpd daemon functionality of atftp 0.7.git20120829-3.1+b1.  A
 >   specially crafted sequence of RRQ-Multicast requests trigger an assert()
 >   call resulting in denial-of-service.  An attacker can send a sequence of
 >   malicious packets to trigger this vulnerability.

 > For more details, see the report:
 > https://talosintelligence.com/vulnerability_reports/TALOS-2020-1029

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
