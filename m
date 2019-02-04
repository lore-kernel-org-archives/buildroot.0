From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 13:37:43 +0100
Subject: [Buildroot] [PATCH] package/opentracing-cpp: needs threads
In-Reply-To: <20190204103007.10599-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 4 Feb 2019 11:30:06 +0100")
References: <20190204103007.10599-1-patrickdepinguin@gmail.com>
Message-ID: <87tvhjvieg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > opentracing-cpp uses std::mutex since 1.3.0.

 > Fixes: http://autobuild.buildroot.net/results/121a9f2aacf9e7b1f5d0b3f2c55bc1da36c7cfb6/

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
