From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 24 Jul 2017 08:43:44 -0400
Subject: [Buildroot] [PATCH v4 2/3] qt5webengine: new package
In-Reply-To: <e8073840-27ae-ff2f-7cbd-2082ba66b5b8@gmail.com>
References: <20170720010527.5359-1-gael.portay@savoirfairelinux.com>
 <20170720010527.5359-3-gael.portay@savoirfairelinux.com>
 <f54d8e9c-aede-ebd1-32b0-a3129333293b@gmail.com>
 <20170721155145.zm2gauvqgoqvxsmy@gportay>
 <e8073840-27ae-ff2f-7cbd-2082ba66b5b8@gmail.com>
Message-ID: <20170724124344.3i5kujdpz6a5kshd@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Fri, Jul 21, 2017 at 08:29:23PM +0200, Zoltan Gyarmati wrote:
> Dear Ga?l,
> 
> On 07/21/2017 05:51 PM, Ga?l PORTAY wrote:
> >
> > No hash entry for qtwebengine-opensource-src-5.9.1.tar.xz
> > That is because you applied my patch after the bump to 5.9.1.
> >
> > 	854b93370 package/qt5: bump latest version to 5.9.1
> 
> Oh, i see, sorry for the noise, i blindly assumed it's against the
> current master.
> 

No worries ;)

My bad if I was too rude.

> (...)
> > 
> > Now, I am enabling the WEBENGINE_CONFIG+=use_system_ffmpeg by default; building
> > the buildroot copy of opus, and it seems to compile.
> Please feel free to send your patch with this config, i'll build and
> test it as well. (although i only have a RaspberryPi3 to test this atm,
> i'll check what other relevant HW i have around...)
> 
> 

I started a new build, and if it works, I will resend a v5 quite soon.

I had to bring a backport a patch from Qt; and to compile udev to run the
webengine samples on my rpi3.

I am glad if you can also test it, and if you have extra hardware; because I can
test only on a rpi 3.

Regards,
Gael
