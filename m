From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Thu, 2 Jan 2014 11:37:58 +0100
Subject: [Buildroot] Wrong compiler path when compiling zlib
In-Reply-To: <20140102103439.GW6589@tarshish>
References: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
 <20140102044704.GF6589@tarshish>
 <CA+hj=Mqv-+aJiSYFDZUnh_3Est=aC26CfC6kr_FkqM58sjNj3Q@mail.gmail.com>
 <20140102091925.GO6589@tarshish>
 <CA+hj=MoPxwwNn76Sh3vgP5VpkFsUn6uMRKtYW76a-A4DpoMkxg@mail.gmail.com>
 <20140102103439.GW6589@tarshish>
Message-ID: <CA+hj=MpO+iC+YwcHcBsSL7kNMfFAhaV8MZz-mai86tnOD6E3Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

yes you're right it's quite unusual in fact I changed it to little
endian but I still see the same toolchain paths that aren't pointing
to the custom pre-installed I've selected.



On Thu, Jan 2, 2014 at 11:34 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> HI Ivan,
>
> On Thu, Jan 02, 2014 at 11:08:16AM +0100, Ivan Wagner wrote:
>> On Thu, Jan 2, 2014 at 10:19 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>> > Do you see the same error? Something else? Can you post your .config?
>>
>> Yes the error is exactly the same. Here's the .config file:
>
> [...]
>
>> BR2_ARCH="armeb"
>> BR2_ENDIAN="BIG"
>
> Big endian ARM? This is quite unusual.
>
> [...]
>
>> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://arago-project.org/git/projects/linux-am33x.git"
>
> I don't think that AM33x SoCs are big endian. What happens if you change to
> little endian ARM?
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
