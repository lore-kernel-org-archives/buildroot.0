From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 21:47:45 +0100
Subject: [Buildroot] [PATCH] package/systemd: Set fallback hostname
In-Reply-To: <20180123231558.5840-1-chris.lesiak@licor.com> (Chris Lesiak's
 message of "Tue, 23 Jan 2018 17:15:58 -0600")
References: <20180123231558.5840-1-chris.lesiak@licor.com>
Message-ID: <87vaflaexa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:

 > When BR2_TARGET_GENERIC_HOSTNAME is set, use the config option
 > --with-fallback-hostname to specify the fallback hostname to use
 > if none is configured in /etc/hostname.  This is useful in a
 > pristine installation with an empty /etc.

 > Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
