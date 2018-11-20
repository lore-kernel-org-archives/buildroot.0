From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2018 19:35:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs wchar
In-Reply-To: <20181116092424.79d94e4b@windsurf>
References: <20181023160931.16417-1-bernd.kuhls@t-online.de>
 <CAFSsvmqEdPu2V3j=d55j6cUVmNeC0MSjTmA5HM1R5HcWh1LzwA@mail.gmail.com>
 <643ca3d2-1825-4707-5fbb-0817229188f9@mind.be>
 <20181101223046.72222a3c@windsurf> <20181115165903.GL10271@scaer>
 <20181116092424.79d94e4b@windsurf>
Message-ID: <20181120183509.GD2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-16 09:24 +0100, Thomas Petazzoni spake thusly:
> On Thu, 15 Nov 2018 17:59:03 +0100, Yann E. MORIN wrote:
> > And in retrospect, I think it *is* better that we do drop them. If the
> > top-level option loses that dependency, then it is 'easy' to detect it
> > has become mandatory for a sub-option, because the autobuilders will
> > fail.
> > 
> > However, if we repeat the dependency and the top-level option lses it
> > and we forget to remove it, we will never realise that the sub-option
> > shouldalso lose it.
> 
> That is indeed a good argument. Should we settle on the idea that we
> should not uselessly replicate such dependencies ?

Yes, let's not replicate them.

And accept patches that removes them.

And accept a patch that updates the manual accordnigly, of course! ;-)
(I'll see what I can do...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
