From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Dec 2012 15:29:07 -0800
Subject: [Buildroot] Chances in skeleton don't appear in filesystem
In-Reply-To: <20121204100344.3167d0e9@skate> (Thomas Petazzoni's message of
 "Tue, 4 Dec 2012 10:03:44 +0100")
References: <slrnkbqn5h.1p8.narkewoody@zuhnb712.local.com>
 <20121204100344.3167d0e9@skate>
Message-ID: <874nk1l7lo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> What's the correct method to modify the defualt filesystem? Thanks.

 Thomas> Do use a custom skeleton, use a custom post-build script to copy/modify
 Thomas> files in output/target. See

s/Do use/Do NOT use/

Alternatively, if you do use a custom rootfs skeleton and want the
skeleton changes to be taken into consideration without doing a clean
rebuild you can manually make the changes under output/target as well
and rerun make.

Using a post-build script is easier though.

-- 
Bye, Peter Korsgaard
