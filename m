From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 22:59:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/linux: fix custom dts files
 handling
In-Reply-To: <20180313180006.5364-1-rafal.susz@gmail.com> (Rafal Susz's
 message of "Tue, 13 Mar 2018 19:00:05 +0100")
References: <20180313142635.27423-1-rafal.susz@gmail.com>
 <20180313180006.5364-1-rafal.susz@gmail.com>
Message-ID: <87370gt107.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rafal" == Rafal Susz <rafal.susz@gmail.com> writes:

 > Custom dts files are still conditionally copied based on non existing
 > boolean. So it is currently not possible to use custom dts file(s) at all.

 > List of dts files is now iterated and files are copied into dedicated kernel arch dir.

 > Signed-off-by: Rafal Susz <rafal.susz@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
