From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Jun 2017 07:57:50 +0300
Subject: [Buildroot] [PATCH 00/14] toolchain-external: remove support
 for glibc before 2.17
In-Reply-To: <20170623213351.GU26922@waldemar-brodkorb.de>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <02e9b62f-282c-ce57-a706-ccbbb33a5f0f@mind.be>
 <20170622170131.7yvbkhrvute2movf@tarshish>
 <20170623213351.GU26922@waldemar-brodkorb.de>
Message-ID: <20170625045750.pguatblz6jdb2j2w@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Fri, Jun 23, 2017 at 11:33:51PM +0200, Waldemar Brodkorb wrote:
> Baruch Siach wrote,
> 
> > package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
> > 
> >   Needed for uClibc posix_spawnp().
> 
> Then it shouldn't be needed, if it is only for uClibc-ng.

It's your patch (commit d3af7772d07aa5). Feel free to update/remove it.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
