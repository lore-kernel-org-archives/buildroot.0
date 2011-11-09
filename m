From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 Nov 2011 08:20:54 +0100
Subject: [Buildroot] [PATCH 6/6] lzma: remove deprecated
In-Reply-To: <87ehxiusex.fsf@macbook.be.48ers.dk>
References: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
 <1318343912-5480-6-git-send-email-gustavo@zacarias.com.ar>
 <87ehxiusex.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LUO8WXMTDa07=ju9i3hN5JGTDOzWCQ+UhVEgTB3fWw-nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 9, 2011 at 12:05 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
> ?Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> ?Gustavo> ---
> ?Gustavo> ?package/Config.in ? ? ? ? | ? ?1 -
> ?Gustavo> ?package/lzma/Config.in ? ?| ? 12 ------------
> ?Gustavo> ?package/lzma/lzma.mk ? ? ?| ? 16 ----------------
> ?Gustavo> ?package/lzma/lzmacheck.sh | ? ?9 ---------
>
> It still seems to be used by fs/ and linux/ and dependencies check.

Which dependencies check do you mean?
It's true that there is a toolchain/dependencies/check-host-lzma.sh
file, but it isn't used anywhere, together with
package/lzma/lzmacheck.sh. I have a pending patch to remove both
files, together with some other dependency stuff, but I'm waiting for
2011.11-rc1 to not pollute the list too much.

~Thomas
