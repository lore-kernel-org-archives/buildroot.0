From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Jan 2019 15:02:59 +0100
Subject: [Buildroot] [PATCH] checkpackagelib: fix Python3 execution
In-Reply-To: <5c38052556fc4_7b6b3f9bfc12550c7150@ultri5.mail>
References: <20190110205539.10468-1-patrickdepinguin@gmail.com>
 <5c38052556fc4_7b6b3f9bfc12550c7150@ultri5.mail>
Message-ID: <CAAXf6LU0C2Wq2SHk4UyXw2LxSwH9vJ1s_WXZao-3J61HX2icqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El vie., 11 ene. 2019 a las 3:53, Ricardo Martincoski
(<ricardo.martincoski@gmail.com>) escribi?:
>
> Hello,
>
> On Thu, Jan 10, 2019 at 06:55 PM, Thomas De Schampheleire wrote:
>
> > The relative imports do not work in Python 3. Adding the leading dot works
> > both in Python2 and Python3.
> >
> > This may cause problems if ever you would try to call the helper .py files
> > directly, but this is not currently needed/supported.
>
> Could you review this one instead?
> http://patchwork.ozlabs.org/patch/956517/
>
>

Done, thanks for pointing me to it.

/Thomas
