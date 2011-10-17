From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Oct 2011 23:13:46 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111017184718.71afc290@skate> (Thomas Petazzoni's message of
 "Mon, 17 Oct 2011 18:47:18 +0200")
References: <20111017184718.71afc290@skate>
Message-ID: <87hb3748z9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> At ELCE, I will be talking about "Using Buildroot for real projects".
 Thomas> You can see my talk summary at
 Thomas> https://events.linuxfoundation.org/events/embedded-linux-conference-europe/petazzoni.

 Thomas> The current (unfinished) status of my slides is visible at:
 Thomas>   http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf

Thanks, a few quick comments:

p3: s/How it works?/How does it work?/
p5: minor, configuration doesn't match output on p6
p7: "It does not track which packages installs what" <- Is that
    important to know how it works?
p9: use uclibc and rootfs size would be half ;)
p11: s/needs to build rebuilt/needs to be rebuilt/
p11: s/built with crosstool-NG/from above/
p12: s/knows some/contains presets for/
p12: s/well-known toolchains/well-known binary toolchains/
p14: s/for it build/for it to build/
p16: "Up to Buildroot 2011.11" reads a bit odd to me (E.G. is it now
     fixed or not?) Perhaps simply say "Until recently, it wasn't easy
     to use Buildroot with a custom"

-- 
Bye, Peter Korsgaard
