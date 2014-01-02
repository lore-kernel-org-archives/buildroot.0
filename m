From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Jan 2014 13:17:44 +0200
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <CA+hj=MpY+U_9RNpcVzaSgq9Zmg2tqcxoh8nWWhRbo3O+3yFEgg@mail.gmail.com>
References: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
 <20140102044704.GF6589@tarshish>
 <CA+hj=Mqv-+aJiSYFDZUnh_3Est=aC26CfC6kr_FkqM58sjNj3Q@mail.gmail.com>
 <20140102091925.GO6589@tarshish>
 <CA+hj=MoPxwwNn76Sh3vgP5VpkFsUn6uMRKtYW76a-A4DpoMkxg@mail.gmail.com>
 <20140102103439.GW6589@tarshish>
 <CA+hj=MpO+iC+YwcHcBsSL7kNMfFAhaV8MZz-mai86tnOD6E3Qw@mail.gmail.com>
 <20140102110639.GY6589@tarshish>
 <CA+hj=MpY+U_9RNpcVzaSgq9Zmg2tqcxoh8nWWhRbo3O+3yFEgg@mail.gmail.com>
Message-ID: <20140102111744.GZ6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,

On Thu, Jan 02, 2014 at 12:09:17PM +0100, Ivan Wagner wrote:
> On Thu, Jan 2, 2014 at 12:06 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > Check what these symlinks under output/host/usr/bin/ point to.
> 
> Interesting... There are no symlinks within output/host/usr/bin
> 
> So it seems that the symbolic links are missing? Who's responsible for
> the creation of these symlinks?

See the TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER macro in 
toolchain/toolchain-external/toolchain-external.mk.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
