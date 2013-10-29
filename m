From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Oct 2013 21:03:18 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <20131029184331.GG3411@free.fr>
References: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
 <cover.1382894622.git.yann.morin.1998@free.fr>
 <a89033d9a1639d8899191cae05b772b1646b6ddd.1382894622.git.yann.morin.1998@free.fr>
 <867c8550-360d-40e7-96d1-9391ed121afc@email.android.com>
 <20131029184331.GG3411@free.fr>
Message-ID: <CAAXf6LX2vwh4EhxbD+ois1-3tCXgSGbGmmw+e9nP2D=09CzOZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Ryan,

On Tue, Oct 29, 2013 at 7:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2013-10-27 22:40 +0100, Thomas De Schampheleire spake thusly:

>> I personally find the name STEP_HOOKS pretty vague, if you don't know
>> the context you have no clue what it could be. The other hooks
>> POST_EXTRACT etc are clear from their name.
>> Maybe, GLOBAL_INSTRUMENTATION_HOOKS?
>
> I'm on the side of Ryan here: it is way too long. :-p
> I'll try to see if I can come with a better name, though.
>

I'm fine with looking at other names, of course, but I don't see how
GLOBAL_INSTRUMENTATION_HOOKS
is longer than
FOO_POST_INSTALL_STAGING_HOOKS
FOO_POST_INSTALL_TARGET_HOOKS
or
CONNTRACK_TOOLS_PRE_CONFIGURE_HOOKS

Besides, it's not that you're writing this so regularly that the
length is really so important, IMHO.

Best regards,
Thomas
