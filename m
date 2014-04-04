From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 4 Apr 2014 11:19:13 +0200
Subject: [Buildroot] [PATCH v3 1/1] manual/configure.txt: fix typo
In-Reply-To: <533E4A29.2070009@mind.be>
References: <1396560067-14091-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <533E4A29.2070009@mind.be>
Message-ID: <CAAXf6LUQ-K-9GCJ0nLmz58ApzQA9L+7YTBxA7Hp-KM66cRciaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Apr 4, 2014 at 7:59 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/04/14 23:21, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>
>  Could you add to the commit log _why_ this is a typo? You're removing a
> backslash in one place and adding it in another place, so it is not at
> all obvious why this is the correct thing to do. In fact, it's not a
> typo, it's a formatting error.
>

I think that C++ can always be written unescaped, unless it is
enclosed in a 'preformatted-text' statement. Normally this is achieved
with + signs, but +C+++ is not valid. That's why, in
adding-packages-directory.txt, I used:

* C++ support
** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
** Comment string: `C++`

If there are other cases where escaping is needed, this should indeed
be clearly mentioned in the commit message.

Best regards,
Thomas
