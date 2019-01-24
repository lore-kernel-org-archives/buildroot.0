From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:13:34 +0100
Subject: [Buildroot] [git commit] package/lua-msgpack-native: adjust
 Config.in comment
In-Reply-To: <20190102074531.78746811FC@busybox.osuosl.org> (Peter Korsgaard's
 message of "Wed, 2 Jan 2019 08:48:45 +0100")
References: <20190102074531.78746811FC@busybox.osuosl.org>
Message-ID: <878szaics1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=61415067604f6c2bf381b39597946bcaf0844f33
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The Config.in comment of lua-msgpack-native only indicates that it
 > needs Lua 5.1, while the package can actually build with LuaJIT. This
 > commit adjusts the comment to match the reality.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
