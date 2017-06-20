From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jun 2017 14:09:03 +0200
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.1
In-Reply-To: <20170620074534.3734712e@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 20 Jun 2017 07:45:34 +0200")
References: <20170618212004.32001-1-peter@korsgaard.com>
 <20170619220921.49a88bd9@windsurf.home>
 <CAGtPAdVCrcJuGdEuTquYpoJpO5qUmi8QRQWVzrGWTUb1MPumSg@mail.gmail.com>
 <20170620074534.3734712e@windsurf.home>
Message-ID: <8760fqg8tc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 20 Jun 2017 13:12:23 +0800, xlcwu wrote:

 >> patch failed need a little cosmetic:
 >> 
 >> a/expat/configure.ac -> a/configure.ac
 >> b/expat/configure.ac -> b/configure.ac

 > Thanks, I've fixed that:

 >   https://git.buildroot.org/buildroot/commit/?id=1940a66114bb6962dfdcee928e5c5fa5f29c0be7

 > Best regards,

Sorry about that, it seems like I made a mistake when I moved from a
custom patch to picking the upstream one.

-- 
Bye, Peter Korsgaard
