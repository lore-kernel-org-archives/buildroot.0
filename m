From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2016 20:36:05 +0000
Subject: [Buildroot] [Bug 9321] Vanilla libcrypt++ v5.6.3 doesn't allow to
 work Nvidia Tegra's flash utility (tegrarcm)
In-Reply-To: <bug-9321-163@https.bugs.busybox.net/>
References: <bug-9321-163@https.bugs.busybox.net/>
Message-ID: <bug-9321-163-5Rvg9tKY51@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9321

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your patch. However, all your patches (except the conversion to
autotools) have already been merged in upstream cryptopp, so I've simply bumped
our cryptopp package to version 5.6.5.

See
https://git.buildroot.org/buildroot/commit/?id=da90437be784fa88e1f149067056096dd6847c26
for more details.

Do not hesitate to test tegrarcm again with this updated cryptopp version, and
report back. Thanks a lot!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
