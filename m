From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Aug 2013 09:50:47 -0300
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
 $(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <20130823070113.122e718f@skate>
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
 <20130823070113.122e718f@skate>
Message-ID: <52175AA7.3030709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/23/2013 02:01 AM, Thomas Petazzoni wrote:

> Would you mind testing/acking this patch? You've been doing quite some
> Python stuff, so I'd appreciate to have your input on this.

Looks good in principle.
I'd like another thing fixed since for the target setuptools... purge
the damn windows executables :)
In the host that might not matter much, but for the target we're talking
~ 400 KiB extra nonsense (those cli*.exe and gui*.exe files that are
shipped).
The tests might be another candidate for removal at ~ 200 KiB.
Regards.
