From: Charles Manning <cdhmanning@gmail.com>
Date: Wed, 12 Aug 2015 08:11:08 +1200
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
In-Reply-To: <20150811114020.GD25261@tarshish>
References: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
 <20150811114020.GD25261@tarshish>
Message-ID: <CAE21AQqJwCZMRDj3C+JEHjoNJvprxhZusW6TTfNWVwLaL7UziA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Are you saying I should explain here or in the commit notice?

Actually udev would work too.

The wf111 driver set uses hotpug to perform the firmware patching
(loading .xbv files).

From what I have experienced, fw patching is required when you first
fire up a new module and when you change modes (sta only vs ap).






On Tue, Aug 11, 2015 at 11:40 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> HI Charles,
>
> On Tue, Aug 11, 2015 at 07:17:02PM +1200, Charles Manning wrote:
>> wf111 really needs mdev
>
> Please explain why.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
