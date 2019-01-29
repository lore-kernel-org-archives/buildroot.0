From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:59:40 +0100
Subject: [Buildroot] [PATCH 3/8] Revert "avrdude: add license
 information"
In-Reply-To: <20190127185943.1136-4-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:38 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-4-ricardo.martincoski@gmail.com>
Message-ID: <87sgxb2khf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > This reverts commit d1f545004bf0533064363d87c2d7c71e7acf7435 from 2014
 > because the added variables already existed. The real problem at the
 > time was that one of the pre-existent variables had a typo, fixed in a
 > later commit.

 > Currently AVRDUDE_LICENSE and AVRDUDE_LICENSE_FILES are declared twice
 > with the same values for each one. So remove one of them.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Wojciech M. Zabolotny <wzab01@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
