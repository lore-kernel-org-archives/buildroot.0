From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 26 May 2008 12:11:44 -0300
Subject: [Buildroot] Need few clarification/help regarding qtopia & x11
	build
In-Reply-To: <17468762.post@talk.nabble.com>
References: <17468762.post@talk.nabble.com>
Message-ID: <d6cda7730805260811y3ae2ff84ud68a5a1af38d3da6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 26, 2008 at 6:41 AM, Hebbar <gururajakr@sanyo.co.in> wrote:
> 1 main thing is that when he sed the qmake.conf file for qmake_cxx , it
> edits all the references of qmake_cxx and not just qmake_cxx, i mean it also
> changes below variables. kindly help me to resolve the same. how to make the
> sed edit only the mentioned qmake_cxx.

I will take a look at it. Thanks :)

> Also i think he contributed for the xserver implementation and thanks to he
> i learnt a lot and now i am successfully running xserver on arm926ejs with
> tslib, xcalibrate and many other x11 apps. i added a few patches taken from
> openembedded and now tslib, xcalibrate and many other works very nicely. i
> can send the patch if  buildrrot needs it.

I'm sure john would be interested in taking a look at it. Feel free to
send it to mainstream or to the googlecode fork.

Kind Regards,
   Thiago A. Correa
