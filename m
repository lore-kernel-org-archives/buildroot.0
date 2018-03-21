From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2018 17:54:15 +0000
Subject: [Buildroot] [Bug 10886] openssl-1.0.2n fails to build
In-Reply-To: <bug-10886-163@https.bugs.busybox.net/>
References: <bug-10886-163@https.bugs.busybox.net/>
Message-ID: <bug-10886-163-7URLO4yPqJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10886

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Strange, openssl/libopenssl builds just fine here, please try

    $ rm -r r build/libopenssl-1.0.2n
    $ make libopenssl

..and in case of a failure please post the complete build log of the
make step (make libopenssl 2>&1 | tee br_libopenssl.log)

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
