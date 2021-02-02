From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 16:34:43 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats:
 get_config_packages(): use dict.values()
In-Reply-To: <20210201122056.6732-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Feb 2021 13:20:56 +0100")
References: <20210201122056.6732-1-peter@korsgaard.com>
Message-ID: <87tuqujxf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > There is no need to get both the key and the value out of the dict if the
 > key is not used, so use dict.values() instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
