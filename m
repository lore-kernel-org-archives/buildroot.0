From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 11 Mar 2009 18:57:24 -0300
Subject: [Buildroot] svn commit: [25617] trunk/buildroot:
	package/qtopia4 target/device/Atmel/arch etc...
In-Reply-To: <874oxz91g8.fsf@macbook.be.48ers.dk>
References: <20090311213508.40B567645B@busybox.osuosl.org>
	<874oxz91g8.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730903111457s66ad7bces799ad7e549946b3a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Mar 11, 2009 at 6:47 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>
> Wouldn't you expect most people enabling QT wanting to have this
> enabled? E.G. shouldn't it have a 'default y' ?

Sure, it would be nice to keep the old behavior.

> (I take it that the u-boot stuff was a mistake)
>

Yeah, I already reverted it. I wasn't fast enough on the Ctrl+C when I
noticed the mistake :(
