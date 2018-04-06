From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 12:42:45 +0200
Subject: [Buildroot] [PATCH 1/1] python-yieldfrom: fix wrong package
 name in license
In-Reply-To: <20180406102003.10572-1-asafka7@gmail.com> (Asaf Kahlon's message
 of "Fri, 6 Apr 2018 13:20:03 +0300")
References: <20180406102003.10572-1-asafka7@gmail.com>
Message-ID: <87h8oolioq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > Fix the _LICENSE and _LICENSE_FILES variables, that were mistakenly
 > created with PYTHON_JSONMODELS instead of PYTHON_YIELDFROM

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Heh, funny that nobody noticed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
