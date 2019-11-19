From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:39:41 +0100
Subject: [Buildroot] [PATCH 08/11] package/mariadb: use bundled GPL-2.0+
 libreadline
In-Reply-To: <20191113151724.12155-9-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:21 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-9-peter@korsgaard.com>
Message-ID: <87pnhopb5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > mariadb is licensed under GPL-2.0, which is not license compatible with
 > modern readline (GPL-3.0+), so instead use the bundled older version
 > (GPL-2.0+ licensed) of readline instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
