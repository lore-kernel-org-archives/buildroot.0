From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Jan 2014 11:19:25 +0200
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <CA+hj=Mqv-+aJiSYFDZUnh_3Est=aC26CfC6kr_FkqM58sjNj3Q@mail.gmail.com>
References: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
 <20140102044704.GF6589@tarshish>
 <CA+hj=Mqv-+aJiSYFDZUnh_3Est=aC26CfC6kr_FkqM58sjNj3Q@mail.gmail.com>
Message-ID: <20140102091925.GO6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,

On Thu, Jan 02, 2014 at 10:06:58AM +0100, Ivan Wagner wrote:
> On Thu, Jan 2, 2014 at 5:47 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > This should be a symlink to the external toolchain wrapper. See the comment in
> > toolchain/toolchain-external/toolchain-external.mk for some more information
> > on this wrapper. I guess that a 'make clean' would solve your problem.
> 
> I tried with the make clean cmd in order to start with a cleaned env
> but it's not working.

Do you see the same error? Something else? Can you post your .config?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
