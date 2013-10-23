From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Wed, 23 Oct 2013 22:30:47 +0200
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <CAAXf6LV9pBCwsqrtm6LJxiO1oaYX4afBv0tHPgOqVReV058GTA@mail.gmail.com>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
 <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
 <CACjG4B+7riHKmXG0Oo3cZxrWFygTBojSTHRktuYvz0eeMJ0ttQ@mail.gmail.com>
 <526809E4.30203@mind.be>
 <CACjG4BJtk-JxzUGmJn9urrMGMjkcwtmMxRys_FGrY761H1zQzA@mail.gmail.com>
 <CAAXf6LV9pBCwsqrtm6LJxiO1oaYX4afBv0tHPgOqVReV058GTA@mail.gmail.com>
Message-ID: <CACjG4BJ0Qzv=GevE3rNHvc3n-YxOTg7FpWHmz1sAz4Q6+Q3wyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/23 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> make knows exactly how to evaluate such variables, so instead of
> trying to do this from a script, isn't it possible to use the output
> of 'make printvars' ? This prints _all_ the relevant variables but you
> could filter on _SOURCE or _SITE to get what you need and base your
> script on that.
>
>
Great ! I looked for something like that but I probably missed it, thanks
for the tip.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/dcf0a243/attachment.html>
