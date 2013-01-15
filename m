From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 11:51:43 +0100
Subject: [Buildroot] [PATCH 1/3] boost: fix build problem by always
	building a threaded version
In-Reply-To: <1358246728-5141-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 15 Jan 2013 11:45:26 +0100")
References: <1358246728-5141-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sj62n2gw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Boost normally allows to build a non-threaded variant by passing
 Thomas> threading=single or a multi-threaded variant by passing
 Thomas> threading=multi.

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
