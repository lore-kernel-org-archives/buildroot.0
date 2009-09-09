From: Will Newton <will.newton@gmail.com>
Date: Wed, 9 Sep 2009 10:36:06 +0100
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <87zl9516bu.fsf@macbook.be.48ers.dk>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<87a5b0800909081003t2b923eb5tf1d5a79b56262b7b@mail.gmail.com>
	<87zl9516bu.fsf@macbook.be.48ers.dk>
Message-ID: <87a5b0800909090236i3936f7d3u2424eccba398160b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 8, 2009 at 10:20 PM, Peter Korsgaard<jacmet@uclibc.org> wrote:
>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
> Hi,
>
> ?>> ?4. Remove BR2_TOPDIR_PREFIX and BR2_TOPDIR_SUFFIX
> ?>>
> ?>> ? ?The same thing can be done with O=
>
> ?Will> I didn't know this existed either!
>
> It's documented though:
>
> http://buildroot.net/buildroot.html#building_out_of_tree

I was referring to the TOPDIR prefix and suffix options. Having delved
into the makefiles it looks to me like O= is a better option.
