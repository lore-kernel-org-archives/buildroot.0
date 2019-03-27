From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:00:55 +0100
Subject: [Buildroot] [PATCH] lvm2: Update to 2.02.183
In-Reply-To: <20190322021921.25949-1-sam@mendozajonas.com> (Samuel
 Mendoza-Jonas's message of "Fri, 22 Mar 2019 13:19:21 +1100")
References: <20190322021921.25949-1-sam@mendozajonas.com>
Message-ID: <871s2sq8o8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

 > In particular update to solve an issue where LVM would fail to
 > initialise LVM devices when asynchronous IO was not available and it
 > would fail to fall back to synchronous IO. [0][1]

 > [0] https://bugzilla.redhat.com/show_bug.cgi?id=1650652
 > [1] https://github.com/open-power/petitboot/issues/60

 > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
