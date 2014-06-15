From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 18:26:33 +0300
Subject: [Buildroot] [git commit] haserl: bump 0.9.x version
In-Reply-To: <20140613200236.78B559CFBC@busybox.osuosl.org>
References: <20140613200236.78B559CFBC@busybox.osuosl.org>
Message-ID: <20140615152633.GG4064@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,

On Fri, Jun 13, 2014 at 10:01:51PM +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f86ec0b67f147d23928091f27529c5fd47ef5f02
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes a number of security issues and adds support for PUT/DELETE. From the
> release mail:
> 
> <snip>
> Stephen R??ttger reported a number of security bugs, the most serious of

Is it possible to send commit messages with charset=utf-8 to make these '??' 
characters readable? Both post-receive-email and multimail from git's 
contrib/hooks/ directory support utf-8 by default.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
