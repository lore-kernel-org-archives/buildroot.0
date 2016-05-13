From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 May 2016 10:56:25 +0300
Subject: [Buildroot] [PATCH] libinput: remove unneeded patch
In-Reply-To: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
References: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
Message-ID: <20160513075625.GT2419@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, May 13, 2016 at 09:09:52AM +0300, Baruch Siach wrote:
> The log_msg symbol conflict was fixed in libevdev commit e4c315fc1603 (Rename
> symbols leaking from static library to avoid name clashes, 2014-08-18) that
> was included in version 1.3. Remove the patch that used to fix this issue.

I meant libevdev version in this last line, since it's a libevdev commit. 
We're at 1.4.6 on that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
