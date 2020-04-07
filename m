From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 21:29:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.28.0
In-Reply-To: <20200324215809.77787-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 24 Mar 2020 15:58:09 -0600")
References: <20200324215809.77787-1-james.hilliard1@gmail.com>
Message-ID: <878sj7m6wn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Adjust fix build with musl patch for 2.28.0.

This is a security bump, so should be marked as such:

https://webkitgtk.org/security/WSA-2020-0003.html

What about the corresponding webkitgtk bump?

-- 
Bye, Peter Korsgaard
