From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 09 Feb 2020 10:05:43 +0100
Subject: [Buildroot] [PATCH] package/Config.in: fix make failure by
 removing gstreamer/Config.in
In-Reply-To: <20200209083651.117868-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 9 Feb 2020 09:36:51 +0100")
References: <20200209083651.117868-1-giulio.benetti@benettiengineering.com>
Message-ID: <877e0wt9js.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > After commit:
 > https://git.buildroot.net/buildroot/commit/?id=fb49c7a26182f9d48f8283e7328fddc216962c94
 > gstreamer entry in package/Config.in was left behind resulting in every
 > make call to fail. So let's remove orphaned gstreamer entry from
 > package/Config.in

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Crap, thanks for fixing it.

-- 
Bye, Peter Korsgaard
