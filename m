From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Jan 2019 08:49:11 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/lua-msgpack-native: adjust
 Config.in comment
In-Reply-To: <20181231165003.18574-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 31 Dec 2018 17:50:02 +0100")
References: <20181231165003.18574-1-thomas.petazzoni@bootlin.com>
 <20181231165003.18574-3-thomas.petazzoni@bootlin.com>
Message-ID: <87k1jnpki0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The Config.in comment of lua-msgpack-native only indicates that it
 > needs Lua 5.1, while the package can actually build with LuaJIT. This
 > commit adjusts the comment to match the reality.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
