From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Aug 2014 13:53:29 +0300
Subject: [Buildroot] HTTP access to git repository outdated
In-Reply-To: <20140825105119.GA31345@dalaran.sceen.net>
References: <20140825105119.GA31345@dalaran.sceen.net>
Message-ID: <20140825105329.GE2661@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Mon, Aug 25, 2014 at 12:51:19PM +0200, Richard Braun wrote:
> It looks like git update-server-info isn't run automatically since
> getting the repository through http gives a slightly outdated tree.

This is a known problem. Try adding or removing the trailing slash from the 
git repository URL.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
