From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 25 Mar 2015 11:00:34 +0100
Subject: [Buildroot] [PATCH] linux: add an option to install kernel
 headers into staging
In-Reply-To: <20150325005755.0033da35@free-electrons.com>
References: <1427191230-23152-1-git-send-email-nicolas.serafini@sensefly.com>
 <20150325005755.0033da35@free-electrons.com>
Message-ID: <20150325110034.3cf8761d@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Wed, 25 Mar 2015 00:57:55 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Nicolas Serafini,
> 
> On Tue, 24 Mar 2015 11:00:30 +0100, Nicolas Serafini wrote:
> > The kernel headers are installed into /usr/src/linux-headers-version
> > of the staging folder.
> > 
> > These headers can be used, for example, by a post build script to
> > install or update some new headers from the kernel in /usr/include
> > of the staging.
> 
> Can you give some more details and background about the issue you're
> trying to solve? You're only explaining what your solution is, but not
> what the original problem is.

I have explain my problem in the mail response to Yann.

Regards,
Nicolas

> 
> Best regards,
> 
> Thomas



-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
