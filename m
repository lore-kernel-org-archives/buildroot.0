From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Mar 2019 00:01:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix static build
 without lua
In-Reply-To: <CAPi7W81MtxfKomR77Gar4eKw4ianFAPGUBn3c9XfSpjNZ7Bj8A@mail.gmail.com>
References: <20190304214720.13703-1-fontaine.fabrice@gmail.com>
 <20190307224345.4336952c@windsurf>
 <CAPi7W81MtxfKomR77Gar4eKw4ianFAPGUBn3c9XfSpjNZ7Bj8A@mail.gmail.com>
Message-ID: <846ee573-f57b-77fd-c690-f137644cc365@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/03/2019 19:19, Fabrice Fontaine wrote:
> The issue (fixed by the patch) is that swudpate always tries to build
> lua_swupdate.so even if there is no object files in this shared
> library when CONFIG_LUA is not set.

 I've included this explanation in the commit message and applied to master, thanks.

 Regards,
 Arnout
