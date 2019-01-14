From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 14 Jan 2019 12:09:13 -0800
Subject: [Buildroot] Xtensa toolchain issue ?
In-Reply-To: <20190110155649.2e5654cd@windsurf>
References: <20190102112130.0b8d32f8@windsurf>
 <CAMo8BfJR7vgLDONmKDX3S8RLyJBMYmXEKjjEr3JK5JOTHrd5hg@mail.gmail.com>
 <20190104102735.52e7e733@windsurf>
 <CAMo8BfLe2amCfDH2MdrQH+7PXx16P5BjGy1zMe5gxZ+YkYEtxQ@mail.gmail.com>
 <20190110155649.2e5654cd@windsurf>
Message-ID: <CAMo8BfJG5JzwEiSXPRpQ3nEBMPeDC-Yw6W4_oBFz-JiAioqjjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 10, 2019 at 6:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> > > Since the issue also happens on OpenRISC, perhaps we need to have some
> > > BR2_TOOLCHAIN_SUPPORTS_XYZ boolean that says whether the gcc version
> > > supports this specific stuff. However, since I don't clearly understand
> > > what the issue is, I wouldn't be able to find a good name for that
> > > BR2_TOOLCHAIN_SUPPORTS_XYZ option.
> > >
> > > BR2_TOOLCHAIN_SUPPORTS_TAIL_CALL_VARIADIC_FUNC_FROM_THUNK ? :-)
> >
> > Maybe BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK?
>
> Sounds like a good name. Do you want to cook a patch for this, or
> should I do so ?

Let me try to come up with a patch.

-- 
Thanks.
-- Max
