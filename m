From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:23:05 +0100
Subject: [Buildroot] [PATCH v2 5/8] gptfdisk: fix installation step
In-Reply-To: <1362689131-1479-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:45:27 +0100")
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362689131-1479-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2v7x83q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The installation step was not giving the full destination path even
 Thomas> though it was using -D, and it was forgetting to explicitly specify
 Thomas> the permissions of the file to install. This commit fixes both of
 Thomas> these minor issues.

Committed, thanks.

-- 
Bye, Peter Korsgaard
