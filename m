From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 23:28:56 +0100
Subject: [Buildroot] [PATCH v5] luvi: new package
In-Reply-To: <1446104703-21295-1-git-send-email-joerg.krause@embedded.rocks>
References: <1446104703-21295-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151220232856.12acbfe8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 29 Oct 2015 08:45:03 +0100, J?rg Krause wrote:
> Add package luvi version v2.3.5.
> 
> luvi extends LuaJIT with asynchronous I/O and several optional modules to run
> Lua applications and build self-contained binaries.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v3 -> v5: (v4 is same as v3, forgot commit --amend)
>  - bump to v2.3.5
>  - remove patch from upstream

Thanks, patch applied. I must say I don't really understand what this
luvi thing is doing, but it built fine here, and the packaging seems
reasonable.

I was somewhat surprised by:

	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-2.0.4/?.lua

as this ?.lua doesn't really look like a path, but since it builds
fine, maybe I'm missing something.

I'm CC'ing Fran?ois, in case he has something to say about this new
package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
