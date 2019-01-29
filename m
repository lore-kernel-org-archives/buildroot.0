From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:56:25 +0100
Subject: [Buildroot] [PATCH 1/8] package/s6-networking: fix dependency
 when libressl is enabled
In-Reply-To: <20190127185943.1136-2-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:36 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-2-ricardo.martincoski@gmail.com>
Message-ID: <871s4v3z7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit "c5b85231fb s6-networking: enable SSL if libressl is selected"
 > actually dropped the dependency on s6-dns and s6 when libressl is
 > enabled.
 > Fix this by using += inside the conditional code.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
