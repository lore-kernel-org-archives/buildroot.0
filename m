From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 May 2019 14:01:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/lynx: remove duplicate
 dependency for host-pkg-conf
In-Reply-To: <1557917096-20967-1-git-send-email-email@gmail.com> (Vadim
 Kochan's message of "Wed, 15 May 2019 13:44:56 +0300")
References: <1557917096-20967-1-git-send-email-email@gmail.com>
Message-ID: <874l5w3p0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > From: Vadim Kochan <vadim4j@gmail.com>
 > host-pkg-conf is already in default lynx's dependencies so remove it
 > from openssl condition block.

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
