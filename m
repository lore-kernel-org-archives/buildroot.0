From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 17:36:47 +0200
Subject: [Buildroot] [PATCH] package/gst-omx: default to pass
 --with-omx-target=generic
In-Reply-To: <20190401101157.6510-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Apr 2019 12:11:56 +0200")
References: <20190401101157.6510-1-peter@korsgaard.com>
Message-ID: <87zhp4qx9s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > target defaults to none, which isn't a legal target:
 > configure: Using none as OpenMAX IL target
 > configure: error: invalid OpenMAX IL target, you must specify one of --with-omx-target={generic,rpi,bellagio,tizonia,zynqultrascaleplus}

 > Instead default to 'generic', fixing the build with E.G. nvidia-tegra23.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
