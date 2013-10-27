From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 10:34:40 +0100
Subject: [Buildroot] [PATCH v4] ccache: expose control interface via
	'make ccache-options'
In-Reply-To: <1381427457-25627-1-git-send-email-tjlee@ambarella.com> (Tzu-Jung
 Lee's message of "Thu, 10 Oct 2013 10:50:57 -0700")
References: <CAAXf6LWg8YGG-yv3dvZjqswagBOMV8gmT1XsWz4KOygEbFUtGw@mail.gmail.com>
 <1381427457-25627-1-git-send-email-tjlee@ambarella.com>
Message-ID: <87hac3xdjj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tzu-Jung" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 > usage:
 > 	# set cache limit size
 > 	make CCACHE_OPTIONS="--max-size=5G" ccache-options

 > 	# zero statistics counters
 > 	make CCACHE_OPTIONS="--zero-stats" ccache-options

 > Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>

Committed with the redundant ifeq removed as pointed out by Thomas,
thanks.

-- 
Bye, Peter Korsgaard
