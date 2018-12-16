From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 16:14:09 +0100
Subject: [Buildroot] [git commit] package/prosody: fix runtime
 dependencies
In-Reply-To: <20181206220522.DD08B85A8D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 6 Dec 2018 23:08:34 +0100")
References: <20181206220522.DD08B85A8D@busybox.osuosl.org>
Message-ID: <874lbda4hq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=768a9b9dd7ef0d2e1bc35e41352f0df6daf59d46
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > prosody is not available for Lua 5.3, but only 5.1 & 5.2.

 > prosody needs the module BitOp which is included in LuaJIT

 > note: the actual config is working only LuaJIT
 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
