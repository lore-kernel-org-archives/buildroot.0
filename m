From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 Jun 2019 22:36:51 +0200
Subject: [Buildroot] [Lua 0/2] Lua modules removal
In-Reply-To: <20190608211827.7731-1-francois.perrad@gadz.org>
References: <20190608211827.7731-1-francois.perrad@gadz.org>
Message-ID: <cb9f5645-6484-7ccc-ca81-3e79ccb51a9d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/06/2019 23:18, Francois Perrad wrote:
> This serie removes 2 Lua modules which are Lua 5.1 only
> and not actively maintained by upstream.

 This needs a bit more context though... Is the intention to remove Lua 5.1? And
what about luajit?

 We tend to not remove unmaintained packages unless there is a good reason for it.

 Regards,
 Arnout
