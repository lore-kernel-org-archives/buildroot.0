From: Mitch Davis <mjd+buildroot@afork.com>
Date: Tue, 20 Jul 2010 10:13:40 +1000
Subject: [Buildroot] [PATCH 5/5] toolchain: rename base target for
	external toolchains
In-Reply-To: <201007192249.00218.yann.morin.1998@anciens.enib.fr>
References: <1278967576-11399-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1278967576-11399-6-git-send-email-yann.morin.1998@anciens.enib.fr> 
	<AANLkTimlLPyUd1RuH0ReU45-4m_r7CANO8Rk7ERht22W@mail.gmail.com> 
	<201007192249.00218.yann.morin.1998@anciens.enib.fr>
Message-ID: <AANLkTima_gfr1zxHQtUWn4qwlGIVtwSCeMYPqZMNGz4G@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 20, 2010 at 6:48 AM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
>
> Maybe smthg like:
> fill-me-that-fscking-staging-and-target-with-the-fscking-runtime-from-toolchain-and-dont-forget-headers-and-statics-for-staging-please-oh-and-build-the-toolchain-if-needed-while-youre-at-it-if-you-dont-care-you-are-such-a-lovely-pet

Got my vote :-)

Seriously, how about just "c"?  The idea being that once you've made
that target, you can build things written in C.  After all, we already
have packages with dependencies of "php", "python", "lua" and
"microperl"...

Mitch.
