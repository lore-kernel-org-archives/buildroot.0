From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 07:45:34 +0200
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.1
In-Reply-To: <CAGtPAdVCrcJuGdEuTquYpoJpO5qUmi8QRQWVzrGWTUb1MPumSg@mail.gmail.com>
References: <20170618212004.32001-1-peter@korsgaard.com>
 <20170619220921.49a88bd9@windsurf.home>
 <CAGtPAdVCrcJuGdEuTquYpoJpO5qUmi8QRQWVzrGWTUb1MPumSg@mail.gmail.com>
Message-ID: <20170620074534.3734712e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 13:12:23 +0800, xlcwu wrote:

> patch failed need a little cosmetic:
> 
> a/expat/configure.ac -> a/configure.ac
> b/expat/configure.ac -> b/configure.ac

Thanks, I've fixed that:

  https://git.buildroot.org/buildroot/commit/?id=1940a66114bb6962dfdcee928e5c5fa5f29c0be7

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
