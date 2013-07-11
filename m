From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 11 Jul 2013 11:51:50 -0500
Subject: [Buildroot] [PATCH v4 2/2] qt: add powervr and opengl
In-Reply-To: <20130711114523.1384e3c6@skate>
References: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
 <51DDAF1A.5040602@carallon.com> <20130711104744.7fa84966@skate>
 <51DE77FE.2060709@carallon.com> <20130711114523.1384e3c6@skate>
Message-ID: <CAEBucnBBAZAqH+2waqAfwkHTg3ADXi3xXthVJx3QWaUiUKpmzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Okay, I wasn't really aware there was today another PowerVR
> implementation. Is it fully API-compatible with the PowerVR stuff of
> the ti-gfx package currently done by Spenser? What is this other
> PowerVR thing for compared to the one currently packaged by Spenser?
> Is the 'ti-gfx' package name chosen by Spenser appropriate?

There are several implementations available (there's at least 3 for TI
alone) there's the one that Ubuntu is using for the Pandaboard,
there's the new http://git.ti.com/graphics releases, and the
TI_Graphics_SDK. For each of these implementations, the main
difference is the platforms they support.

Thanks,
Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
