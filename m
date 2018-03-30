From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:25:39 +0200
Subject: [Buildroot] [PATCH 09/10] python-jsonschema: needs
 python-functools32 when used with python 2.7
In-Reply-To: <20180309191701.23760-10-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Mar 2018 20:17:00 +0100")
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-10-peter@korsgaard.com>
Message-ID: <87sh8hxnl8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From setup.py:
 > extras_require = {
 >     ..
 >     ":python_version=='2.7'": ["functools32"],

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
